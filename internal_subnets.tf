resource "aws_subnet" "internal_subnets" {
  for_each = { for index, item in var.internal_subnets : index => item }

  vpc_id = aws_vpc.vpc.id

  cidr_block              = var.internal_subnets[each.key]["cidr_block"]
  availability_zone       = var.internal_subnets[each.key]["availability_zone"]
  map_public_ip_on_launch = false

  depends_on = [aws_internet_gateway.igw]

  tags = {
    "Name"        = var.internal_subnets[each.key]["name"]
    "Environment" = var.env
  }
}
