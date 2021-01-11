resource "aws_route_table" "rt-main" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    "Name"        = "${var.env}-rt-main"
    "Environment" = var.env
  }
}

resource "aws_main_route_table_association" "rt-main-association" {
  vpc_id         = aws_vpc.vpc.id
  route_table_id = aws_route_table.rt-main.id
}

resource "aws_route_table" "internal-subnet-rt" {
  for_each = { for index, item in aws_nat_gateway.nat : index => item }

  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat[each.key].id
  }

  tags = {
    "Name"        = "${var.env}-rt-internal-${aws_subnet.internal_subnets[each.key].availability_zone}"
    "Environment" = var.env
  }
}

resource "aws_route_table_association" "internal-subnet-rt-association" {
  for_each = { for index, item in aws_route_table.internal-subnet-rt : index => item }

  subnet_id      = aws_subnet.internal_subnets[each.key].id
  route_table_id = aws_route_table.internal-subnet-rt[each.key].id
}

resource "aws_route_table_association" "external-subnet-rt-association" {
  for_each = { for index, item in aws_subnet.external_subnets : index => item }

  subnet_id      = aws_subnet.external_subnets[each.key].id
  route_table_id = aws_route_table.rt-main.id
}
