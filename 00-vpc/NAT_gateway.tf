resource "aws_nat_gateway" "First_nat_gateway" {
  allocation_id = aws_eip.for_NAT.id
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "1stNATGateway"
  }
}