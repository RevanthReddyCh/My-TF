resource "aws_vpc" "variable-vpc" {
  cidr_block = var.vpc-cidr

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc-name
  }

}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.variable-vpc.id
  cidr_block              = var.subnets-cidr[0]
  availability_zone       = var.az[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.variable-vpc.id
  cidr_block              = var.subnets-cidr[1]
  availability_zone       = var.az[1]
  map_public_ip_on_launch = false

  tags = {
    Name = "private_subnet"
  }
}