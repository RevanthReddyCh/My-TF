resource "aws_instance" "public_instance" {
  ami           = "ami-0b8b44ec9a8f90422"
  instance_type = "t2.medium"
  subnet_id     = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  #vpc_security_group_ids = [aws_security_group.docker_sg.id]
  user_data = base64encode(file("userdata.sh"))

  key_name      = "ohio"

  tags = {
    Name = "PublicInstance"
  }
}