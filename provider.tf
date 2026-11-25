terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.73.0"
    }

    tls = {
      source = "hashicorp/tls"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}