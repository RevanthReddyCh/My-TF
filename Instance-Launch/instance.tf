resource "aws_instance" "public_instance" {
  ami           = "ami-0aff18ec83b712f05"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.allow_all_traffic.id}"]

  key_name      = "us-west-2"

  tags = {
    Name = "Ansible-Controller"
  }

}

resource "aws_instance" "public_instance2" {
  ami           = "ami-0aff18ec83b712f05"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet2.id
  associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.allow_all_traffic.id}"]

  key_name      = "us-west-2"

  tags = {
    Name = "Ansible-Node-1"
  }
}

resource "aws_instance" "public_instance3" {
  ami           = "ami-0aff18ec83b712f05"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet2.id
  associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.allow_all_traffic.id}"]

  key_name      = "us-west-2"

  tags = {
    Name = "Ansible-Node-2"
  }
}