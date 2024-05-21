resource "aws_vpc" "import-vpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "imp-vpc"
    }
}

data "aws_subnet" "imp-subnet" {
    id = "subnet-05de9a399e4be9f55"
}

resource "aws_instance" "imp-instance" {
    ami = "ami-09040d770ffe2224f"
    instance_type = "t2.micro"
    subnet_id = data.aws_subnet.imp-subnet.id
    key_name = "ohio"

    tags = {
        Name = "Pub-instance"
    }
}

