terraform {
  required_version = ">= 0.13"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.7.0"
    }
  }
  backend "s3" {
    bucket         = "vpc-rds-terraform-state"
    key            = "aurora/postgress/us-east-1.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraformLocks2"
  }
}

provider "aws" {
  region = var.region
}
