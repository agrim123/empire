resource "aws_vpc" "production" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support = true  

  tags = {
    "Name"        = "production"
    "Environment" = "production"
  }
}