resource "aws_security_group" "my-sg"{
    name = "my-sec-grp"
    vpc_id = aws_vpc.myvpc.id
    tags = {
        Name = "${var.vpc-name}-sg"
    }
}