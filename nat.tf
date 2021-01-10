resource "aws_nat_gateway" "production-nat-1a" {
  subnet_id     = aws_subnet.production-external-1a.id
  allocation_id = aws_eip.production-nat-eip-1a.id

  tags = {
    "Name"        = "production-nat-1a"
    "Environment" = "production"
  }
}

resource "aws_nat_gateway" "production-nat-1b" {
  subnet_id     = aws_subnet.production-external-1b.id
  allocation_id = aws_eip.production-nat-eip-1b.id

  tags = {
    "Name"        = "production-nat-1b"
    "Environment" = "production"
  }
}

resource "aws_nat_gateway" "production-nat-1c" {
  subnet_id     = aws_subnet.production-external-1c.id
  allocation_id = aws_eip.production-nat-eip-1c.id

  tags = {
    "Name"        = "production-nat-1c"
    "Environment" = "production"
  }
}
