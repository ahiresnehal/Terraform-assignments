provider "aws" {
  region = "ap-south-1"
}


# To a create a instance
resource "aws_instance" "ec2_example" {

  ami           = "ami-0f8ca728008ff5af4"
  instance_type = "t2.micro"
  tags = {
    Name = "Terraform EC2"
  }
  key_name               = "aws_key"
  vpc_security_group_ids = [aws_security_group.main.id]


  # File provisioner
  provisioner "file" {
    source      = "/home/snehal/Documents/terraform-day3/test-file.txt"
    destination = "/home/ubuntu/test-file.txt"
  }

  # Local-exec provisioner

  provisioner "local-exec" {
    #command = "touch hello-local-exec-provisioner.txt"
    # Output of instance ip
    command = "echo ${aws_instance.ec2_example.private_ip} >> private_ips.txt"
  }


  # Remote-exec Provisioner 
  provisioner "remote-exec" {
    inline = [
      "touch hello.txt",
      "echo helloworld remote provisioner >> hello.txt",
    ]
  }


  # To copy files securely
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ubuntu"
    private_key = file("/home/snehal/Documents/keys/aws_key")
    timeout     = "4m"
  }
}

resource "aws_security_group" "main" {
  egress = [
    {
      cidr_blocks      = ["0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
  ingress = [
    {
      cidr_blocks      = ["0.0.0.0/0", ]
      description      = ""
      from_port        = 22
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 22
    }
  ]
}

resource "aws_key_pair" "deployer" {
  key_name   = "aws_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCxvjt+N4xhqOFrHe7aenR9Ua86CPA6VUtyp1u6rECMePE+6eNWUdlm8wXJJwnKp6p+WNPKVZcdFSQ5Wd+r5JHmJUUMU5FyPqoecUzsvGrS+OuXC1dvqs1ihcWC63wj3UhqoPm5hbfRZNwQ8+cl83TlRevAfpyGSUd4Cn76D+efSp11nuc5sWOqoj7xJIqMFyVgxMQ0o18bbIDJjUEHf9upsR+ViHemN/211uNowdYS7AlCIgwizel2kCK3AZ18wMv3XZs2bKwXigPqee624P4x33S7PhDYQ6jIXEXX0lTxuCv7i2ICInHrod0OeqUWRCiSH4WRJ1EkCjowBXtDnxQ7 snehal@GS-6091"
}







 