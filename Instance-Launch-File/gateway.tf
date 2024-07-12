resource "aws_internet_gateway" "usw2_gateway" {
  vpc_id = aws_vpc.myvpc2.id

  tags = {
    Name = "usw2-igw"
  }
}