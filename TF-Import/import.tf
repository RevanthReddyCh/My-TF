provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "import" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc2"
  }
}

data "aws_subnet" "imp_sub" {
  id = "subnet-0d507b17f965a4e1f"
}

resource "aws_instance" "public_instance" {
  ami                         = "ami-04b70fa74e45c3917"
  instance_type               = "t2.micro"
  subnet_id                   = data.aws_subnet.imp_sub.id
  associate_public_ip_address = true

  key_name = "N.Virginia"

  tags = {
    Name = "myec2"
  }
}
