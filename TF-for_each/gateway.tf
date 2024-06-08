resource "aws_internet_gateway" "first_igw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "MyIGW"
  }
}
resource "aws_eip" "Elastic-ip" {
  domain = "vpc"

  tags = {
    Name = "EIP"
  }
}

resource "aws_nat_gateway" "NATGW" {
  count = 1
  allocation_id = aws_eip.Elastic-ip.id
  subnet_id    = element(values(aws_subnet.pub-subnets), count.index).id


  tags = {
    Name =  "NATGW"
  }
} 