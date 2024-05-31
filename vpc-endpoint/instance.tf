resource "aws_instance" "pub_instance" {
  ami           = "ami-0a2781a262879e465"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  user_data = base64encode(file("userdata.sh"))

  key_name      = "us-west-1"

  tags = {
    Name = "usw-01-pub-instance"
  }
}

resource "aws_instance" "pri_instance" {
  ami           = "ami-0a2781a262879e465"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_subnet.id
  associate_public_ip_address = true
  user_data = base64encode(file("userdata.sh"))

  key_name      = "us-west-1"

  tags = {
    Name = "usw-01-pri-instance"
  }
}