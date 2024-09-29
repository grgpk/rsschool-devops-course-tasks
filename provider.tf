terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  backend "s3" {
    bucket = "rs-devops-terraform-backend"
    key    = "terraform/backend"
    region = "eu-central-1"
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  # profile = "default"
  region  = var.aws_region
}


