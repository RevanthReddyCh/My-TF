resource "aws_iam_role" "my_role" {
  name = "ec_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name = "ECRole"
  }
}

resource "aws_iam_policy" "s3_full_access_policy" {
  name        = "AmazonS3FullAccess"
  description = "Policy providing full access to Amazon S3"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action   = "s3:*",
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "s3_full_access_attachment" {
  policy_arn = aws_iam_policy.s3_full_access_policy.arn
  role       = aws_iam_role.my_role.name
}





resource "aws_vpc_endpoint" "s3_endpoint" {
  vpc_id = aws_vpc.My1stVPC.id
  service_name = "com.amazonaws.ap-south-2.s3"
  
  route_table_ids = [aws_route_table.public_route_table.id]

  tags = {
    Name = "S3Endpoint"
  }
}