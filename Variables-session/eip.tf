resource "aws_eip" "NAT-GW" {
  domain   = "vpc"

  tags = {
    Name = "EIP_for_NAT"
  }
}