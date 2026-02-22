terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.32.0"
    }
  }

  backend "s3" {
    bucket       = "terraform-s3-bucket-26"
    key          = "terraform.provisioners.tfstate.demo"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}

provider "aws" {
  region = "us-east-1"
}
