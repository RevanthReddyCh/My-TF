resource "aws_internet_gateway" "first_igw" {
  vpc_id = aws_vpc.My1stVPC.id

  tags = {
    Name = "MyIGW"
  }
}