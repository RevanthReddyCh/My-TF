resource "aws_instance" "wsvpc_instance" {
  ami                         = var.ami
  instance_type               = var.instance-type
  subnet_id                   = aws_subnet.wss-pub.id
  associate_public_ip_address = true
  key_name                    = var.key-name

  tags = {
    Name = "${var.vpc-name}-instance"
  }
}