resource "aws_instance" "wsvpc_instance" {
  ami                         = var.ami
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.session1.id
  associate_public_ip_address = true
  key_name                    = "corp_key"

  tags = {
    Name = "${var.vpc-name}-instance"
  }
}