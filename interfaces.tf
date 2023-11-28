variable "aws_region" {
    type = string
    default = "us-east-1"
}

variable "aws_s3_storage_bucket_name" {
    type = string
    description = "storage bucket name"
}

variable "aws_s3_storage_athena_q_result" {
    type = string
    description = "athena query result"
}