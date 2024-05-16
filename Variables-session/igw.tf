resource "aws_internet_gateway" "first_igw" {
  vpc_id = aws_vpc.variable-vpc.id

  tags = {
    Name = "MyIGW"
  }
}