# # creating ssh-key.
resource "aws_key_pair" "key-tf" {
  key_name   = "key-tf"
  public_key = file("${path.module}/id_rsa.pub")
}

# creating securing group
resource "aws_security_group" "allow-tls1" {
  name        = "allow_tls1"
  description = "Allow TLS inbound traffic"

  dynamic "ingress" {
    for_each = [22, 80, 443, 3306, 27017]
    iterator = port
    content {
      description = "TLS from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

# output "securityGroupDetails" {
#   value = aws_security_group.allow_tls.id
# }



resource "aws_instance" "web" {
  ami           = "ami-0f8ca728008ff5af4"
  instance_type = "t2.micro"
  #Assign a key to ec2 instance
  key_name = aws_key_pair.key-tf.key_name
  #Assign a seurity to ec2 instance
  # vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  tags = {
    Name = "first-tf-instance"
  }
}









// To ssh - ssh -i id_rsa ubuntu@65.1.100.175  (public ip of machine)
// ping 8.8.8.8
// sudo -i
// apt-get install nginx
// service nginx status