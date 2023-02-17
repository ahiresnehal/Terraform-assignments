# # creating ssh-key.
resource "aws_key_pair" "key-tf" {
  key_name   = "key-tf"
  public_key = file("${path.module}/id_rsa.pub")
}





resource "aws_instance" "web" {
  ami           = "ami-0f8ca728008ff5af4"
  instance_type = "t2.micro"
  #Assign a key to ec2 instance
  key_name = "${aws_key_pair.key-tf.key_name}"
}






