#creating public subnet in vpc
resource "aws_subnet" "MYpublic_subnet" {
  vpc_id                  = aws_vpc.MYVPC.id #interpolution in aws it is used to refer the string, var to call a function
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true" #

  tags = {
    Name = "MYpublic_subnet"
  }
}