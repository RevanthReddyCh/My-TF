resource "aws_vpc" "import" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "imp-vpc"
  }
   
}

resource "aws_subnet" "imp-subnet" {
vpc_id = aws_vpc.import.id
}

data "aws_subnet""imp-subnet"{
  id = "subnet-06bd65c3ea131d123"
  #vpc_id = aws_vpc.import.id
}

resource "aws_instance" "public_instance" {
  ami           = "ami-09040d770ffe2224f" 
  instance_type = "t2.micro"
  subnet_id     = data.aws_subnet.imp-subnet.id 
  associate_public_ip_address = true

  key_name      = "ohio"

  tags = {
    Name = "PublicInstance"
  }
}

