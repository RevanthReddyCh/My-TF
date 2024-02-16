resource "aws_db_subnet_group" "db-subnet-gp" {
  name       = "mydb-subnets"
  subnet_ids = ["${aws_subnet.pub-subnets.0.id}","${aws_subnet.pub-subnets.1.id}"]

  tags = {
    Name = "My DB subnet group"
  }
}

# data "aws_secretsmanager_secret_version" "secret-version" {
#   secret_id = "dbcreds"
# }

locals {
  dbcredens = jsondecode(aws_secretsmanager_secret_version.newcredens.secret_string)
}


resource "aws_db_instance" "testdb" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = local.dbcredens.username
  password             = local.dbcredens.password
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  publicly_accessible = true
  db_subnet_group_name = aws_db_subnet_group.db-subnet-gp.name
  vpc_security_group_ids = [aws_security_group.my-sg.id]
  identifier = "mydb"
  tags = {
    Name = "MyTfDb"
  }
}