resource "aws_nat_gateway" "First_nat_gateway" {
  allocation_id = aws_eip.NAT-GW.id
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "1stNATGateway"
  }
}