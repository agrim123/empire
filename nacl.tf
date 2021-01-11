locals {
  all_subnets = concat(
    [for subnet in aws_subnet.external_subnets : subnet.id],
    [for subnet in aws_subnet.internal_subnets : subnet.id]
  )
}

resource "aws_default_network_acl" "network-acl-main" {
  default_network_acl_id = aws_vpc.vpc.default_network_acl_id

  ingress {
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    protocol   = "all"
    from_port  = 0
    to_port    = 0
  }

  egress {
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    protocol   = "all"
    from_port  = 0
    to_port    = 0
  }

  subnet_ids = local.all_subnets

  tags = {
    "Name"        = "${var.env}-network-acl-main"
    "Environment" = var.env
  }
}
