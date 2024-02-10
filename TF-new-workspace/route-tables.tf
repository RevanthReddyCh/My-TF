resource "aws_route_table" "session-rt1" {
  vpc_id = aws_vpc.session.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.session_igw.id
  }

  tags = {
    Name = "${var.vpc-name}-pub-rt"
  }
}

resource "aws_route_table" "session-rt2" {
  vpc_id = aws_vpc.session.id

  #   route {
  #     cidr_block = "0.0.0.0/0"
  #   }

  tags = {
    Name = "${var.vpc-name}-pri-rt"
  }
}

resource "aws_route_table_association" "session1" {
  subnet_id      = aws_subnet.session1.id
  route_table_id = aws_route_table.session-rt1.id
}

resource "aws_route_table_association" "session2" {
  subnet_id      = aws_subnet.session2.id
  route_table_id = aws_route_table.session-rt1.id
}

resource "aws_route_table_association" "session3" {
  subnet_id      = aws_subnet.session3.id
  route_table_id = aws_route_table.session-rt2.id
}

resource "aws_route_table_association" "session4" {
  subnet_id      = aws_subnet.session3.id
  route_table_id = aws_route_table.session-rt2.id
}