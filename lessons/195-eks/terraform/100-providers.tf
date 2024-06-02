################################################################################
## Terraform Version and Required Providers
################################################################################
terraform {
  required_version = ">= 1.8"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "> 5"
    }
    random = {
      source  = "hashicorp/random"
      version = "> 3"
    }
    time = {
      source  = "hashicorp/time"
      version = "> 0.11"
    }
  }
}

################################################################################
## AWS Provider
################################################################################
provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      product_id   = "15035"
      used_for     = "sbx"
      ManagedByTFE = "true"
    }
  }
}

################################################################################
## Data Sources
################################################################################
## Fetches the current AWS region
data "aws_region" "current_region" {}


## Fetches the available availability zones in the current region
data "aws_availability_zones" "current_az" {
  state = "available"
}

## Fetches the current AWS account ID
data "aws_caller_identity" "current" {}

################################################################################


