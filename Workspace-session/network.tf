resource "aws_vpc" "ws-vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.vpc-name}"
  }
}

resource "aws_subnet" "wss-pub" {
  vpc_id            = aws_vpc.ws-vpc.id
  availability_zone = "us-east-2a"
  cidr_block        = var.pub-sub-cidr

  tags = {
    Name = "${var.vpc-name}-pub-subnet"
  }
}

resource "aws_subnet" "wss-pri" {
  vpc_id            = aws_vpc.ws-vpc.id
  availability_zone = "us-east-2b"
  cidr_block        = var.pri-sub-cidr

  tags = {
    Name = "${var.vpc-name}-pri-subnet"
  }
}