resource "aws_internet_gateway" "production-igw" {
  vpc_id = aws_vpc.production.id

  tags = {
    "Name" = "production-igw"
  }
}
