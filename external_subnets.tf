resource "aws_subnet" "external_subnets" {
  for_each = { for index, item in var.external_subnets : index => item }

  vpc_id = aws_vpc.vpc.id

  cidr_block              = var.external_subnets[each.key]["cidr_block"]
  availability_zone       = var.external_subnets[each.key]["availability_zone"]
  map_public_ip_on_launch = true

  depends_on = [aws_internet_gateway.igw]

  tags = {
    "Name"        = var.external_subnets[each.key]["name"]
    "Environment" = var.env
  }
}
