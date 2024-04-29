terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    }
  }
}


provider "aws" {
  region = var.regionName # arguments(just inputs given by us to create a resource)
  alias  = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "thisisalsoforterraform"
    key            = "statefile"
    region         = "us-east-1"
    dynamodb_table = "statefile1"

  }
}


