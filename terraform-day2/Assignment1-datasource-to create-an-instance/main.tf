 provider "aws" {

   region     = ""
   access_key = ""
   secret_key = ""
 }

 resource "aws_instance" "ec2_example" {
 ami                                  = "ami-0f8ca728008ff5af4"
  instance_type                        = "t2.micro"
 
 
  }
