provider "aws" {
  region = "ap-south-1"
}


# To a create a instance
resource "aws_instance" "ec2_example" {

  count         = 4
  ami           = "ami-0f8ca728008ff5af4"
  instance_type = "t2.micro"
  

}