resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.aws_s3_bucket_name

  tags = {
    Name        = "ehcaas-pts"
    Environment = "Dev"
  }
}


resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  count = var.create_bucket_policy == true ? 1 : 0
  bucket = aws_s3_bucket.s3_bucket.id
  policy = jsonencode({
    "Version": "2008-10-17",
    "Id": "Policy1335892530063",
    "Statement": [
        {
            "Sid": "Stmt1335892150622",
            "Effect": "Allow",
            "Principal": {
                "Service": "billingreports.amazonaws.com"
            },
            "Action": [
                "s3:GetBucketAcl",
                "s3:GetBucketPolicy"
            ],
            "Resource": "arn:aws:s3:::",
            "Condition": {
                "StringEquals": {
                    "aws:SourceArn": "arn:aws:cur:us-east-1:371337360534:definition/*",
                    "aws:SourceAccount": "371337360534"
                }
            }
        },
        {
            "Sid": "Stmt1335892526596",
            "Effect": "Allow",
            "Principal": {
                "Service": "billingreports.amazonaws.com"
            },
            "Action": [
                "s3:PutObject"
            ],
            "Resource": "arn:aws:s3:::/*",
            "Condition": {
                "StringEquals": {
                    "aws:SourceArn": "arn:aws:cur:us-east-1:371337360534:definition/*",
                    "aws:SourceAccount": "371337360534"
                }
            }
        }
    ]
  })    
}