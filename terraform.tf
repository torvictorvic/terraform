terraform {
  backend "s3" {
    encrypt = true
    bucket  = "xxxxxxxx"
    key     = "xxxxxxxx-xx-xx-infra/terraform.tfstate"
    region  = "us-east-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.50.0"
    }
  }
}
