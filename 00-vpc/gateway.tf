resource "aws_internet_gateway" "first_igw" {
  vpc_id = aws_vpc.My1stVPC.id

  tags = {
    Name = "MyIGW"
  }
}

resource "aws_internet_gateway" "For_VPC2_igw" {
  vpc_id = aws_vpc.My2ndVPC.id

  tags = {
    Name = "2nd_VPC_IGW"
  }
}