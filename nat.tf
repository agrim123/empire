resource "aws_nat_gateway" "nat" {
  for_each = { for index, item in aws_eip.eip : index => item }

  subnet_id     = aws_subnet.external_subnets[each.key].id
  allocation_id = aws_eip.eip[each.key].id

  tags = {
    "Name"        = "${var.env}-nat-${var.external_subnets[each.key]["availability_zone"]}"
    "Environment" = var.env
  }
}
