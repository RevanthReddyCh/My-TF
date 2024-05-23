resource "aws_instance" "wsvpc-instance"{
    ami = "ami-09040d770ffe2224f"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.wss-pub.id
    key_name = "ohio"

    tags = {
        Name = "${var.vpc-name}-instance"
    }
}