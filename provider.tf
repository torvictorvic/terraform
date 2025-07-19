provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias = "awsecs"
  version = "4.50.0"
  region = "us-east-1"
}