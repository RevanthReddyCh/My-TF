resource "aws_instance" "public_instance" {
  ami           = var.ami
  instance_type = var.instance-type
  subnet_id     = aws_subnet.public_subnet.id 
  associate_public_ip_address = true

  key_name      = "hyderabad"

  tags = {
    Name = var.instance-name
  }
}