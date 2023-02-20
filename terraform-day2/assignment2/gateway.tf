#creating internet gateway in aws  VPC
resource "aws_internet_gateway" "My_internetgateway" {
  vpc_id = aws_vpc.MYVPC.id

  tags = {
    Name = "MYVPC"
  }
}