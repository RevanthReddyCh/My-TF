resource "aws_vpc" "myvpc" {
  cidr_block = var.vpc-cidr
  tags = {
    Name = "${var.vpc-name}"
  }
}

resource "aws_subnet" "pub-subnets" {
  vpc_id = aws_vpc.myvpc.id
  count = length(var.subnets_cidr)
  availability_zone = "us-east-1a"
  cidr_block = var.subnets_cidr[count.index]

  tags = {
    Name = "${var.vpc-name}-pub-sub${count.index + 1}"
  }
}

resource "aws_route_table" "pub-rt"{
    vpc_id = aws_vpc.myvpc.id
    tags = {
        Name = "${var.vpc-name}-pub-rt"
    }
    
}

resource "aws_route_table_association" "pub" {
    count = length(var.subnets_cidr)
    route_table_id = aws_route_table.pub-rt.id
    subnet_id = "${aws_subnet.pub-subnets.*.id[count.index]}"
}

output "pub-subnets" {
  value = aws_subnet.pub-subnets[*].id
}
