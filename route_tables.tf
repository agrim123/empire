resource "aws_default_route_table" "production-rt-main" {
  default_route_table_id = aws_vpc.production.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.production-igw.id
  }
  tags = {
    "Name"        = "production-rt-main"
    "Environment" = "production"
  }
}

resource "aws_main_route_table_association" "production-rt-main-association" {
  vpc_id         = aws_vpc.production.id
  route_table_id = aws_default_route_table.production-rt-main.id
}

resource "aws_route_table" "production-rt-1a" {
  vpc_id = aws_vpc.production.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.production-nat-1a.id
  }

  tags = {
    "Name"        = "production-rt-1a"
    "Environment" = "production"
  }
}

resource "aws_route_table_association" "production-internal-1a-subnet-rt-association" {
  subnet_id      = aws_subnet.production-internal-1a.id
  route_table_id = aws_route_table.production-rt-1a.id
  depends_on     = [aws_subnet.production-internal-1a, aws_route_table.production-rt-1a]
}

resource "aws_route_table" "production-rt-1b" {
  vpc_id = aws_vpc.production.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.production-nat-1b.id
  }

  tags = {
    "Name"        = "production-rt-1b"
    "Environment" = "production"
  }
}

resource "aws_route_table_association" "production-internal-1b-subnet-rt-association" {
  subnet_id      = aws_subnet.production-internal-1b.id
  route_table_id = aws_route_table.production-rt-1b.id
  depends_on     = [aws_subnet.production-internal-1b, aws_route_table.production-rt-1b]
}

resource "aws_route_table" "production-rt-1c" {
  vpc_id = aws_vpc.production.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.production-nat-1c.id
  }

  tags = {
    "Name"        = "production-rt-1c"
    "Environment" = "production"
  }
}

resource "aws_route_table_association" "production-internal-1c-subnet-rt-association" {
  subnet_id      = aws_subnet.production-internal-1c.id
  route_table_id = aws_route_table.production-rt-1c.id
  depends_on     = [aws_subnet.production-internal-1c, aws_route_table.production-rt-1c]
}
