#Hello Everyone this is a provider block were we will be defining the providers
terraform {
required_version = ">=1.0.0"
  required_providers {
    aws = {
        source  = "hashicorp/aws"
        version = ">= 1.0.0"
  }
}
}
provider "aws" {
    region = "us-east-2"
    
}