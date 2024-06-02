resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name = "${local.vpc_name}-natgw-eip"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_az1.id

  tags = {
    Name = "${local.vpc_name}-natgw"
  }

  depends_on = [aws_internet_gateway.igw]
}
