resource "aws_vpc" "MyVPC" {
  cidr_block = "10.0.0.0/16"  # Replace with your desired CIDR block for the VPC

  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "2ndvpc"
  }

}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.MyVPC.id
  cidr_block              = "10.0.0.0/28"  # Replace with your desired CIDR block for the subnet
  availability_zone       = "ap-south-2a"    # Replace with your desired availability zone

  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.MyVPC.id
  cidr_block              = "10.0.1.0/28"  # Replace with your desired CIDR block for the subnet
  availability_zone       = "ap-south-2a"    # Replace with your desired availability zone

  tags = {
    Name = "private_subnet"
  }
}
