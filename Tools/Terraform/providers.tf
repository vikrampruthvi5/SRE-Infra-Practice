terraform {
    backend "s3" {
      key = "state_files/sre-infra.tfstate"
      bucket = "pv-terraform-tfstate-files"
      region = "us-east-1"
    }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.34.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}