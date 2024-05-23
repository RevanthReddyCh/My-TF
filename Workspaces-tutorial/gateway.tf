resource "aws_internet_gateway" "ws-igw" {
    vpc_id = aws_vpc.ws-vpc.id
    
    tags = {
         Name = "${var.vpc-name}-igw"
    }
}

resource "aws_nat_gateway" "wss-nat" {
    subnet_id = aws_subnet.wss-pub.id
    allocation_id = aws_eip.for-nat.id
    tags = {
         Name = "${var.vpc-name}-nat-gw"
    }
}

resource "aws_eip" "for-nat" {
    domain = "vpc"

    tags = {
        Name = "${var.vpc-name}-nat-gw-eip"
    }

}