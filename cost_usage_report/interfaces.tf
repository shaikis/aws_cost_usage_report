variable "s3_bucket_name" {
    type = string
    description = "s3 bucket name declared here."
}

variable "s3_bucket_region" {
    type = string
    description = "s3 bucket region declared here."
    default = "us-east-1"
}

variable "s3_prefix" {
    type = string
    description = "s3 bucket folder declared here."
}

variable "aws_cost_usage_report_name" {
    type = string
    description = "s3 bucket folder declared here."
}

variable "aws_cost_usage_report_name" {
    type = string
    description = "report name"
}
variable "cost_report_gen_frequency" {
    type = string
    description = "report generation frequency"
}
variable "report_format" {
    type = string
    description = "report format methods"
}
variable "report_compression" {
    type = string
    description = "report compression method"
}

variable "report_additional_artifacts" {
    type = list
    description = "additional artifacts"
}
