resource "aws_instance" "public_instance" {
  ami                         = var.ami[0]
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public_subnet.id
  associate_public_ip_address = true

  key_name = "hyderabad"

  tags = {
    Name = "PublicInstance"
  }
}


resource "aws_instance" "private_instance" {
  ami                         = var.ami[0]
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.private_subnet.id
  associate_public_ip_address = false

  key_name = "hyderabad"

  tags = {
    Name = "PrivateInstance"
  }
}

