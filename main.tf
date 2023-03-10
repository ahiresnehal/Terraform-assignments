
# Terraform Settings Block
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #version = "~> 3.21" # Optional but recommended in production
    }
  }
}

# Provider Block
provider "aws" {
  region     = "ap-south-1"
  access_key = ""
  secret_key = ""
}

# Resource Block
resource "aws_instance" "ec2demo" {
  ami           = "ami-0f8ca728008ff5af4"
  instance_type = "t2.micro"
}
