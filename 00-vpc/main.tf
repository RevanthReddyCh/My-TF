resource "aws_vpc" "My1stVPC" {
  cidr_block = "10.0.0.0/16"  # Replace with your desired CIDR block for the VPC

  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "My1stVPC"
  }

}

resource "aws_vpc" "My2ndVPC" {
  cidr_block = "192.168.0.0/16"  # Replace with your desired CIDR block for the VPC

  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "My2ndVPC"
  }

}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.My1stVPC.id
  cidr_block              = "10.0.0.0/28"  # Replace with your desired CIDR block for the subnet
  availability_zone       = "ap-south-2a"    # Replace with your desired availability zone
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.My1stVPC.id
  cidr_block              = "10.0.1.0/28"  # Replace with your desired CIDR block for the subnet
  availability_zone       = "ap-south-2a"    # Replace with your desired availability zone
  map_public_ip_on_launch = false

  tags = {
    Name = "private_subnet"
  }
}

resource "aws_subnet" "public_subnet_2ndVPC" {
  vpc_id                  = aws_vpc.My2ndVPC.id
  cidr_block              = "192.168.1.0/28"  # Replace with your desired CIDR block for the subnet
  availability_zone       = "ap-south-2a"    # Replace with your desired availability zone
  map_public_ip_on_launch = true

  tags = {
    Name = "2nd_VPC_public_subnet"
  }
}
