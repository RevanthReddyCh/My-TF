resource "aws_eip" "for_NAT" {
  domain   = "vpc"

  tags = {
    Name = "EIP_for_NAT"
  }
}