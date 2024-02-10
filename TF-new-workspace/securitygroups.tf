resource "aws_security_group" "allow_tls" {
  vpc_id = aws_vpc.session.id
  name   = "public-sg"

  tags = {
    Name = "pub-sg"
  }
}

