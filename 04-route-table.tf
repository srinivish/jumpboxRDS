# create two route table
# one for public subnets
# destination 0.0.0.0/0
# target internet gateway as igw-tf

resource "aws_route_table" "jumpbox" {
  vpc_id = aws_vpc.jumpbox.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.jumpbox.id
  }
}

resource "aws_route_table_association" "jumpbox" {
  subnet_id      = aws_subnet.jumpbox.id
  route_table_id = aws_route_table.jumpbox.id
}

# This route table & association is for the private subnet RDS
resource "aws_route_table" "rds" {
  vpc_id = aws_vpc.jumpbox.id
  depends_on = [ 
    aws_nat_gateway.nat
   ]
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
  tags = {
    Name = "rds-route-table"
  }
}
resource "aws_route_table_association" "rds" {
  count     = length(var.availability_zones)
  subnet_id = aws_subnet.rds[count.index].id
  route_table_id = aws_route_table.rds.id
}
