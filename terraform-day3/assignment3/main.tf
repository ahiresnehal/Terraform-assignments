# Used an s3 bucket module from terraform registry


provider "aws" {
  region = "ap-south-1"
}


module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.7.0"
}
