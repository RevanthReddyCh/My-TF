resource "aws_internet_gateway" "usw1_gateway" {
  vpc_id = aws_vpc.myvpc1.id

  tags = {
    Name = "usw1-igw"
  }
}