resource "aws_vpc_endpoint" "s3" {
  vpc_id            = aws_vpc.myvpc1.id
  service_name      = "com.amazonaws.us-west-1.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = [aws_route_table.public_route_table.id,aws_route_table.private_route_table.id]

  tags = {
    Name = "S3 VPC Endpoint"
  }
}