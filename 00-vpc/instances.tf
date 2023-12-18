resource "aws_instance" "public_instance" {
  ami           = "ami-0c9b645e8436e55aa"  # Replace with your desired AMI ID for the public instance
  instance_type = "t3.micro"  # Replace with your desired instance type
  subnet_id     = aws_subnet.public_subnet.id  # Replace with your public subnet ID
  associate_public_ip_address = true

  key_name      = "learning"  # Replace with your EC2 key pair name

  tags = {
    Name = "PublicInstance"
  }
}

resource "aws_instance" "private_instance" {
  ami           = "ami-0c9b645e8436e55aa"  # Replace with your desired AMI ID for the private instance
  instance_type = "t3.micro"  # Replace with your desired instance type
  subnet_id     = aws_subnet.private_subnet.id  # Replace with your private subnet ID
  associate_public_ip_address = false

  key_name      = "learning"  # Replace with your EC2 key pair name

  tags = {
    Name = "PrivateInstance"
  }
}
