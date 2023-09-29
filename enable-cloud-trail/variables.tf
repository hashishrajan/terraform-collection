#Variables to be used for this folder

variable "aws_region" {
  description = "Region of AWS"
  #default = "us-east-1"
  type = string
}

variable "cloudtrail_bucket_name" {
  description = "Bucket name to store CloudTrial Logs"
  #default = "CloudTrail Bucket Name"
  type = string
}

variable "cloudtrail_name" {
  description = "Name of CloudTrial"
  #default = "CloudTrail  Name"
  type = string
}