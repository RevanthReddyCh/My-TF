resource "aws_vpc" "myvpc1" {
  cidr_block = "10.0.0.0/16"

  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "usw-1-vpc"
  }

}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.myvpc1.id
  cidr_block              = "10.0.1.0/28"
  availability_zone       = "us-west-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "usw-1-pub-subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.myvpc1.id
  cidr_block              = "10.0.2.0/28"
  availability_zone       = "us-west-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "usw-1-pri-subnet"
  }
}