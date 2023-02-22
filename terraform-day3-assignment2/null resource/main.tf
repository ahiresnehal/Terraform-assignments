provider "aws" {
  region     = "ap-south-1"
}

resource "aws_instance" "ec2_example" {
  ami           = "ami-0f8ca728008ff5af4"
  instance_type =  "t2.micro"
  tags = {
    Name = "Terraform EC2 "
  }
}

# The following null resource has the trigger
resource "null_resource" "null_resource_simple" {
  
  # This trigger will only execute once when it detects the instance id of EC2 instance 
  triggers = {
    id = aws_instance.ec2_example.id    # to execute it every time replace - id = time()
  }
  provisioner "local-exec" {
    command = "echo Hello World"
  }
}