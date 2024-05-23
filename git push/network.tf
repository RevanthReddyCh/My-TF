resource "aws_vpc" "ws-vpc" {
    cidr_block = var.vpc_cidr

    tags = {
        Name = var.vpc-name
    }
}

resource "aws_subnet" "wss-pub" {
    vpc_id = aws_vpc.ws-vpc.id
    availability_zone = "us-east-2a"
    cidr_block = var.pub-sub-cidr
     tags = {
        Name = "${var.vpc-name}-pub-sub"
     }
}

resource "aws_subnet" "wss-pri" {
    vpc_id = aws_vpc.ws-vpc.id
    availability_zone = "us-east-2a"
    cidr_block = var.pri-sub-cidr
     tags = {
        Name = "${var.vpc-name}-pri-sub"
     }
}