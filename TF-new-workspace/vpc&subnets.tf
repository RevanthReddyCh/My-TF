resource "aws_vpc" "session" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.vpc-name}"
  }
}

resource "aws_subnet" "session1" {
  vpc_id            = aws_vpc.session.id
  availability_zone = "us-east-1a"
  cidr_block        = var.pub-sub1-cidr

  tags = {
    Name = "${var.vpc-name}-pub-subnet1"
  }
}

resource "aws_subnet" "session2" {
  vpc_id            = aws_vpc.session.id
  availability_zone = "us-east-1b"
  cidr_block        = var.pub-sub2-cidr

  tags = {
    Name = "${var.vpc-name}-pub-subnet2"
  }
}

resource "aws_subnet" "session3" {
  vpc_id            = aws_vpc.session.id
  availability_zone = "us-east-1a"
  cidr_block        = var.pri-sub1-cidr

  tags = {
    Name = "${var.vpc-name}-pri-subnet1"
  }
}

resource "aws_subnet" "session4" {
  vpc_id            = aws_vpc.session.id
  availability_zone = "us-east-1b"
  cidr_block        = var.pri-sub2-cidr

  tags = {
    Name = "${var.vpc-name}-pri-subnet2"
  }
}