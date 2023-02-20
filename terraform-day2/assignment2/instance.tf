
# To create ec2 instance
resource "aws_instance" "web" {
  ami           = var.image_id
  instance_type = var.instance_type
  # #Assign a key to ec2 instance
  # key_name = aws_key_pair.key-tf.key_name
  # #Assign a seurity to ec2 instance
  # vpc_security_group_ids = ["${aws_security_group.allow_tls1.id}"]
  tags = {
    Name = "Terraform EC2"
  }
}


# To fetch instance id
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
    aws_instance.web
  ]
}

output "fetched_info_from_aws" {
  value = data.aws_instance.myawsinstance.id
}


# Creating s3 bucket
resource "aws_s3_bucket" "s3_bucket" {
  bucket = data.aws_instance.myawsinstance.id #name of the bucket 


  tags = {
    Name = "My bucket"

  }
}

# Output of instance ip
output "ip" {
  value = data.aws_instance.myawsinstance.public_ip
}

# # Creating s3 bucket
# resource "aws_s3_bucket" "my-s3-bucket" {
#   bucket_prefix = var.bucket_prefix
#   acl = var.acl

#    versioning {
#     enabled = var.versioning
#   }

#   tags = var.tags
# }

# output "s3_bucket_name" {
#   value = aws_s3_bucket.my-s3-bucket.id
# }

# output "s3_bucket_region" {
#     value = aws_s3_bucket.my-s3-bucket.region
# }





// To ssh - ssh -i id_rsa ubuntu@65.1.100.175  (public ip of machine)
// ping 8.8.8.8
// sudo -i
// apt-get install nginx
// service nginx status