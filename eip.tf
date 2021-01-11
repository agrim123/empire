resource "aws_eip" "eip" {
  for_each = { for index, item in var.external_subnets : index => item }

  vpc        = true
  depends_on = [aws_internet_gateway.igw]
  tags = {
    "Name"        = "eip-${var.external_subnets[each.key]["name"]}"
    "Environment" = var.env
  }
}
