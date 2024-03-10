# This configuration is for enabling RDS server to access internet
# create EIP, NAT Gateway, and route table in 04-route-table.tf file

# Create an Elastic IP for the NAT Gateway
resource "aws_eip" "nat_eip" {
  depends_on = [aws_internet_gateway.jumpbox]
  tags = {
    Name = "NAT Gateway EIP"
  }
}

# Create NAT Gateway
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.jumpbox.id
  tags = {
    Name = "NAT Gateway"
  }
}

