variable "aws_region_default" {
  type        = string
  description = "AWS region to use for the default AWS provider configuration."
}

variable "aws_region_2" {
  type        = string
  description = "AWS region to use for the secondary AWS provider configuration."
}

provider "aws" {
  region = var.aws_region_default
}

provider "aws" {
  alias  = "aws2"
  region = var.aws_region_2
}

// An aws bucket using the default aws provider
resource "aws_s3_bucket" "defualt_provider" {
  bucket = "tf-exmample-default-provider-${formatdate("YYMMDDhhmm",timestamp())}"
  acl    = "private"

  lifecycle {
    ignore_changes = [bucket]
  }

  tags = {
    Name    = "TF example multi module default provider"
    project = "tf-example-multi-module"
  }
}

// An aws bucket using the alternate aws provider
resource "aws_s3_bucket" "alternate_provider" {
  provider = aws.aws2
  bucket   = "tf-exmample-alternate-provider-${formatdate("YYMMDDhhmm",timestamp())}"
  acl      = "private"

   lifecycle {
    ignore_changes = [bucket]
  }

  tags = {
    Name    = "TF example multi module alternate provider"
    project = "tf-example-multi-module"
  }
}

terraform {
  required_version = ">= 0.12"
}