resource "aws_instance" "public_instance" {
  ami           = "ami-0bbc2f7f6287d5ca6"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  #vpc_security_group_ids = [aws_security_group.docker_sg.id]
  user_data = base64encode(file("userdata.sh"))

  key_name      = "hyderabad"

  tags = {
    Name = "PublicInstance"
  }
}