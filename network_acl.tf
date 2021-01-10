resource "aws_default_network_acl" "production-network-acl-main" {
  default_network_acl_id = aws_vpc.production.default_network_acl_id

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

  subnet_ids = [
    aws_subnet.production-external-1a.id,
    aws_subnet.production-external-1b.id,
    aws_subnet.production-external-1c.id,
    aws_subnet.production-internal-1a.id,
    aws_subnet.production-internal-1b.id,
    aws_subnet.production-internal-1c.id,
  ]

  tags = {
    "Name"        = "production-network-acl-main"
    "Environment" = "production"
  }
}
