#declare resources that should be created in AWS Cloud

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "cloudtrail_bucket" {
  bucket        = var.cloudtrail_bucket_name
  force_destroy = true

    policy = <<POLICY

    {}
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AWSCloudTrailAclCheck20150319",
            "Effect": "Allow",
            "Principal": {"Service": "cloudtrail.amazonaws.com"},
            "Action": "s3:GetBucketAcl",
            "Resource": "arn:aws:s3:::var.cloudtrail_bucket_name",
            "Condition": {
                "StringEquals": {
                    "aws:SourceArn": "arn:aws:cloudtrail:region:$(data.aws_caller_identity.current.account_id):trail/var.cloudtrail_name"
                }
            }
        },
        {
            "Sid": "AWSCloudTrailWrite20150319",
            "Effect": "Allow",
            "Principal": {"Service": "cloudtrail.amazonaws.com"},
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::var.cloudtrail_bucket_name/prefix/AWSLogs/$(data.aws_caller_identity.current.account_id)/*",
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control",
                    "aws:SourceArn": "arn:aws:cloudtrail:region:$(data.aws_caller_identity.current.account_id):trail/var.cloudtrail_name"
                  }
                }
        }
        ]
      }
POLICY
}


resource "aws_cloudtrail" "main_cloudtrail" {
  name                          = var.cloudtrail_name
  s3_bucket_name                = aws_s3_bucket.cloudtrail_bucket.bucket
  s3_key_prefix                 = "prefix"
  enable_logging                = true
  include_global_service_events = true
}