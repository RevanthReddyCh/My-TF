resource "aws_vpc" "My1stVPC" {
  cidr_block = var.vpc-cidr

  tags = {
    Name = var.vpc-name
  }

}


resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.My1stVPC.id
  cidr_block              = var.subnets-cidr["public-subnet"]
  availability_zone       = var.az[0]
  
  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.My1stVPC.id
  cidr_block              = var.subnets-cidr["private-subnet"]
  availability_zone       = var.az[1]
  map_public_ip_on_launch = false

  tags = {
    Name = "private_subnet"
  }
}

