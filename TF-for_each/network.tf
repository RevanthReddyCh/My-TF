resource "aws_vpc" "myvpc" {
  cidr_block = var.vpc-cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.vpc-name}"
  }
}



resource "aws_subnet" "pub-subnets" {
  vpc_id = aws_vpc.myvpc.id
  for_each = var.subnets_cidr
  availability_zone = each.key
  cidr_block = each.value
  #count = length(var.subnets_cidr) 
  #cidr_block = var.subnets_cidr[count.index]

  tags = {
    Name = "${var.vpc-name}-pub-sub-${each.key}"
  }
}

resource "aws_subnet" "pri-subnets" {
  vpc_id = aws_vpc.myvpc.id
  for_each = var.pri-subnets-cidr
  availability_zone = each.key
  cidr_block = each.value
  #count = length(var.pri-subnets-cidr) 
  #cidr_block = var.pri-subnets-cidr[count.index]

  tags = {
    Name = "${var.vpc-name}-pri-sub-${each.key}"
  }
 }



