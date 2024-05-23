resource "aws_internet_gateway" "session_igw" {
  vpc_id = aws_vpc.ws-vpc.id

  tags = {
    Name = "${var.vpc-name}-igw"
  }
}

resource "aws_nat_gateway" "First_nat_gateway" {
  allocation_id = aws_eip.for_NAT.id
  subnet_id     = aws_subnet.wss-pub.id

  tags = {
    Name = "1stNATGateway"
  }
}

resource "aws_eip" "for_NAT" {
  domain   = "vpc"

  tags = {
    Name = "EIP_for_NAT"
  }
}