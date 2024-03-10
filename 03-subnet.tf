# Create one subnet for jumpbox server
# create two private subnets for DB server


resource "aws_subnet" "jumpbox" {
  vpc_id                  = aws_vpc.jumpbox.id
  cidr_block              = var.jumpbox-cidr
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = var.jumpbox-subnet
  }
}

# These two subnets are for RDS

resource "aws_subnet" "rds" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.jumpbox.id
  cidr_block        = "25.0.${count.index + 1}.0/24"
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = "Private-Subnet-RDS"
  }
}

resource "aws_db_subnet_group" "rds" {
  name       = "rds-subnet-group"
  subnet_ids = aws_subnet.rds[*].id
  tags = {
    Name = "rds-subnet-group"
  }
}
