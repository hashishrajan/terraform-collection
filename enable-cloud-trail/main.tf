#this is the main declaration file for AWS Provider using Terraform's Latest version as of Sep,2023
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.19.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  #profile = "default"
}
