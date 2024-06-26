terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.23.1"
    }
  }
  backend "s3" {
    bucket = "bucket-fiap56-to-remote-state"
    key    = "aws-lambda-authorizer-soat1-grupo56/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project   = "Lambda Authorizer FIAP 56 with Terraform"
      CreatedAt = formatdate("YYYY-MM-DD", timestamp())
      ManagedBy = "Terraform"
      Owner     = "fiap56soat1"
    }
  }
}
