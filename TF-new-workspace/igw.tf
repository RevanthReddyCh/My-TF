resource "aws_internet_gateway" "session_igw" {
  vpc_id = aws_vpc.session.id

  tags = {
    Name = "${var.vpc-name}-igw"
  }
}