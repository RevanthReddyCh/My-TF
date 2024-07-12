resource "aws_instance" "public_instance" {
  ami           = "ami-0b20a6f09484773af"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.allow_all_traffic.id}"]
  key_name      = "us-west-2"

  provisioner "file" {
    source      = "./ansible-inventory"  # path to the local file
    destination = "/home/ec2-user/hosts"  # destination path on the EC2 instance
  }

  connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("us-west-2.pem")  # path to your private key file
      host        = self.public_ip
    }

  tags = {
    Name = "Ansible-Controller"
  }

  depends_on = [
    aws_instance.public_instance2,
    aws_instance.public_instance3,
    local_file.inventory-file

  ]
}
# To add an other file after creating an instance
resource "null_resource" "copy_additional_file" {
  provisioner "file" {
    source      = "./instance.tf"  # path to the local file in the current folder
    destination = "/home/ec2-user/instance.tf"  # destination path on the EC2 instance

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("us-west-2.pem")  # path to your private key file
      host        = aws_instance.public_instance.public_ip
    }
  }

  provisioner "remote-exec" {
    inline = [
      "ls -la /home/ec2-user/instance.tf"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("us-west-2.pem")  # path to your private key file
      host        = aws_instance.public_instance.public_ip
    }
  }

  depends_on = [
    aws_instance.public_instance
  ]
}


resource "aws_instance" "public_instance2" {
  ami           = "ami-0cf2b4e024cdb6960"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet2.id
  associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.allow_all_traffic.id}"]

  key_name      = "us-west-2"

  tags = {
    Name = "Ansible-Node-1"
  }
}

resource "aws_instance" "public_instance3" {
  ami           = "ami-0cf2b4e024cdb6960"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet2.id
  associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.allow_all_traffic.id}"]

  key_name      = "us-west-2"

  tags = {
    Name = "Ansible-Node-2"
  }
}