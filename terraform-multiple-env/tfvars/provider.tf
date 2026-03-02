terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.32.0"
    }
  }

  backend "s3" {
    # bucket       = "terraform-s3-bucket-26-dev"
    # key          = "tfvars-multi-env-demo"
    # region       = "us-east-1"
    # encrypt      = truecd
    # use_lockfile = true
  }
}

provider "aws" {
  region = "us-east-1"
}
