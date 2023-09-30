#declare resources that should be created in AWS Cloud
resource "aws_s3_bucket" "example_bucket" {
  bucket        = var.cloudtrail_bucket_name
  force_destroy = true
}

resource "aws_cloudtrail" "main_cloudtrail" {
  name                          = var.cloudtrail_name
  s3_bucket_name                = aws_s3_bucket.example_bucket.bucket
  enable_logging                = true
  include_global_service_events = true
}