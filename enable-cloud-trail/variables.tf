#Variables to be used for this folder

variable "aws_region" {
  Description = "Region of AWS"
  #default = "us-east-1"
  type = string
}

variable "cloudtrail_bucket_name" {
  Description = "Bucket name to store CloudTrial Logs"
  #default = "CloudTrail Bucket Name"
  type = string
}

variable "cloudtrail_name" {
  Description = "Name of CloudTrial"
  #default = "CloudTrail  Name"
  type = string
}