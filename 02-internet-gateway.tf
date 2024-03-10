resource "aws_internet_gateway" "jumpbox" {
  vpc_id = aws_vpc.jumpbox.id
  tags = {
    Name = var.ig
  }
}