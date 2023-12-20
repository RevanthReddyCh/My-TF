
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.My1stVPC.id

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
  vpc_id = aws_vpc.My1stVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.First_nat_gateway.id
  }

  tags = {
    Name = "PrivateRouteTable"
  }
}


resource "aws_route_table" "VPC_2_route_table" {
  vpc_id = aws_vpc.My2ndVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.For_VPC2_igw.id
  }

  tags = {
    Name = "VPC2_route_table"
  }
}


resource "aws_route_table_association" "public_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "subnet_VPC2__association" {
  subnet_id      = aws_subnet.public_subnet_2ndVPC.id
  route_table_id = aws_route_table.VPC_2_route_table.id
}