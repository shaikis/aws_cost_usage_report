# In this project creating infra for AWS cost and usage report in grafana.
# Create Required dependencies.
provider "aws" {
  region  = var.aws_region
}

module "s3" {
    source = "./s3"
    aws_s3_bucket_name= var.aws_s3_storage_bucket_name
    create_bucket_policy = true
}

module "cur" {
    source = "./cost_usage_report"
    s3_bucket_name = module.s3.s3_bucket_out_name
    s3_prefix = "grafana"
    report_format = "Parquet"
    report_compression = "Parquet"
    report_additional_artifacts = ["ATHENA"]
    aws_cost_usage_report_name = "aws-cost-usage-report-grafana"
    cost_report_gen_frequency = "HOURLY"
    
}

module "s3_for_athena_query_result" {
    source = "./s3"
    aws_s3_bucket_name= var.aws_s3_storage_athena_q_result
    create_bucket_policy = false
}

module "cloud_formation_stack"{
    source = "./cloud_formation_stack"
}

module "grafana" {
    source = "./grafana"
}