resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.variable-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.first_igw.id
  }

  route {
    cidr_block = "10.0.0.0/28"
    nat_gateway_id = aws_nat_gateway.First_nat_gateway.id
  }

  tags = {
    Name = "PublicRouteTable"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.variable-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.First_nat_gateway.id
  }

  tags = {
    Name = "PrivateRouteTable"
  }
}