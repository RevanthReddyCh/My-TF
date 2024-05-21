provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "import" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "imp-vpc"
  }
}

data "aws_subnet""imp-sub"{
  id = "subnet-0effdb44bbf6a8ba8"
  #vpc_id = aws_vpc.import.id
}

resource "aws_instance" "public_instance" {
  ami           = "ami-04b70fa74e45c3917" 
  instance_type = "t2.micro"
  subnet_id     = data.aws_subnet.imp-sub.id 
  associate_public_ip_address = true

  key_name      = "N.Virginia"

  tags = {
    Name = "PublicInstance"
  }
}

