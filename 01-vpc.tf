resource "aws_vpc" "jumpbox" {
  cidr_block = var.vpc-cidr
  tags = {
    Name = var.vpc
  }
}

