# Provider Configuration
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
  access_key = "AKIA5PLF4NN7AMVLW2VD"
  secret_key = "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"
}