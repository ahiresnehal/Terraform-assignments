
# # creating instance
resource "aws_instance" "web" {
  ami           = "ami-0f8ca728008ff5af4"
  instance_type = "t2.micro"
  
  tags = {
    Name = "new-instance"
  }
}