resource "aws_route_table" "pub-rt" {
  vpc_id = aws_vpc.ws-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.session_igw.id
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.session_igw.id
  }

  tags = {
    Name = "${var.vpc-name}-pub-rt"
  }
}

resource "aws_route_table" "pri-rt" {
  vpc_id = aws_vpc.ws-vpc.id

  route {
    cidr_block = var.pub-sub-cidr
    nat_gateway_id = aws_nat_gateway.First_nat_gateway.id
  }

  tags = {
    Name = "${var.vpc-name}-pri-rt"
  }
}
