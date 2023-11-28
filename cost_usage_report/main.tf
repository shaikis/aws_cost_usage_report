resource "aws_cur_report_definition" "aws_cur_report_definition" {
  report_name                = var.aws_cost_usage_report_name
  time_unit                  = var.cost_report_gen_frequency
  format                     = var.report_format
  compression                = var.report_compression
  additional_schema_elements = ["RESOURCES", "SPLIT_COST_ALLOCATION_DATA"]
  s3_bucket                  = var.s3_bucket_name
  s3_region                  = var.s3_bucket_region
  s3_prefix                  = var.s3_prefix
  additional_artifacts       = var.report_additional_artifacts
}