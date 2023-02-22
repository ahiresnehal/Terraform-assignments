terraform {
  required_version = ">=0.12"
}

resource "aws_instance" "ec2_module_2" {

    ami = "ami-0f8ca728008ff5af4"
    instance_type = "t2.micro"
    key_name= "mykey"
    vpc_security_group_ids = [aws_security_group.main.id]

  user_data = <<-EOF
      #!/bin/sh
      sudo apt-get update
      sudo apt install -y apache2
      sudo systemctl status apache2
      sudo systemctl start apache2
      sudo chown -R $USER:$USER /var/www/html
      sudo echo "<html><body><h1>Hello this is module-2 at instance id `curl http://169.254.169.254/latest/meta-data/instance-id` </h1></body></html>" > /var/www/html/index.html
      EOF
}

resource "aws_security_group" "main" {
    name        = "EC2-SG-2"
  description = "Webserver for EC2 Instances"

  ingress {
    from_port   = 80
    protocol    = "TCP"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    protocol    = "TCP"
    to_port     = 22
    cidr_blocks = ["115.97.103.44/32"]
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_key_pair" "deployer" {
  key_name   = "mykey"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDXKNkNUHPJd7coCzT7g3nMvotYCT0foVhFINvmyOYQLWNPFcVUrsE/mMm69BefCZ5rNccGqhwuwQzFSZiq3GxVwGTYKE9g0wTdMVIKElRrVDP2ayypsSmjQ6SXRdGyXTWCW7DGzKDkxdTrD81jnQABR6vbxb+lv64TZu4Xko/K0t9dVVAhYrGb8N4wq96PU30c+Pv8yDZaUohd4x156O5F/6VBo6xcJVsew9nNOaBAHw35gl+/9gJuXtSqMcfQzvj4eT/XMRulXSh2VKqaaBtlcyxXIhJ8x7qvCc1S9qpGLJ+loKQDZHs+ABSx7WQ4jTDNV+SVNuP+lDfDWXF826Yj snehal@GS-6091"
}