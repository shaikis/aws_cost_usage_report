resource "aws_athena_workgroup" "athena_wg" {
  name = var.athena_workgroup_name

  configuration {
    enforce_workgroup_configuration    = true
    publish_cloudwatch_metrics_enabled = true

    result_configuration {
      output_location = "s3://${var.athena_query_result_bucket}/"

      encryption_configuration {
        encryption_option = "SSE_S3"
       }
    }
  }

  tags = {
    GrafanaDataSource = true
  }
}