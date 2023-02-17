

resource "aws_instance" "web" {
  ami           = var.image_id
  instance_type = var.instance_type
  #Assign a key to ec2 instance
  key_name = aws_key_pair.key-tf.key_name
  #Assign a seurity to ec2 instance
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  tags = {
    Name = "first-tf-instance"
  }
}









// To ssh - ssh -i id_rsa ubuntu@65.1.100.175  (public ip of machine)
// ping 8.8.8.8
// sudo -i
// apt-get install nginx
// service nginx status