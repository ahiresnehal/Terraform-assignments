provider "aws" {
 
  region     = ""
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "ec2_example" {

  ami           = "ami-0f8ca728008ff5af4"
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform EC2"
  }
}

data "aws_instance" "myawsinstance" {
  filter {
    name   = "tag:Name"
    values = ["Terraform EC2"]
  }

  filter {
    name   = "instance-state-name"
    values = ["running"]
  }

  depends_on = [
    aws_instance.ec2_example
  ]
}

output "fetched_info_from_aws" {
  value = data.aws_instance.myawsinstance.public_ip
}