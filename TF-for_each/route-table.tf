resource "aws_route_table" "pub-rt"{
    vpc_id = aws_vpc.myvpc.id
    tags = {
        Name = "${var.vpc-name}-pub-rt"
    }

    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.first_igw.id
  }
    
}

resource "aws_route_table_association" "pub" {
    count = 3
    route_table_id = aws_route_table.pub-rt.id
    subnet_id      = element(values(aws_subnet.pub-subnets), count.index).id
    #subnet_id = "${aws_subnet.pub-subnets.*.id[count.index]}"
}

resource "aws_route_table" "pri-rt"{
    vpc_id = aws_vpc.myvpc.id
    tags = {
        Name = "${var.vpc-name}-pri-rt"
    }

    route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.NATGW[0].id
  }
    
}

resource "aws_route_table_association" "pri" {
    count = 3
    route_table_id = aws_route_table.pri-rt.id
    subnet_id      = element(values(aws_subnet.pri-subnets), count.index).id
    #subnet_id = "${aws_subnet.pub-subnets.*.id[count.index]}"
}