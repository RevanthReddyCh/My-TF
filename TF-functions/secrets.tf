resource "random_password" "mypasswd" {
  length  = 12
  special = true
  override_special = "="
  min_special = 2
}

resource "aws_secretsmanager_secret" "newcreds"{
    name = "sqldbcredens"
}

resource "aws_secretsmanager_secret_version" "newcredens" {
  secret_id     = aws_secretsmanager_secret.newcreds.id
  secret_string = <<EOF
  {
    "username" : "admin",
    "password" : "${random_password.mypasswd.result}"
    }
  EOF
}