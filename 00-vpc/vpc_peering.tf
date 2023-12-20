resource "aws_vpc_peering_connection" "vpc_peering" {
  peer_owner_id          = aws_vpc.My1stVPC.owner_id
  peer_vpc_id            = aws_vpc.My1stVPC.id
  vpc_id                 = aws_vpc.My2ndVPC.id
  auto_accept            = true

  tags = {
    Name = "VPCPeeringConnection1&2"
  }
}

resource "aws_route" "route_to_peer" {
  route_table_id         = aws_route_table.VPC_2_route_table.id
  destination_cidr_block = "10.0.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
}

resource "aws_route" "route_to_local" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "192.168.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
}