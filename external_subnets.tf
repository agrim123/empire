resource "aws_subnet" "production-external-1a" {
  vpc_id = aws_vpc.production.id

  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-southeast-1a"
  map_public_ip_on_launch = true

  depends_on = [aws_internet_gateway.production-igw]

  tags = {
    "Name"        = "production-external-1a"
    "Environment" = "production"
  }
}

resource "aws_subnet" "production-external-1b" {
  vpc_id = aws_vpc.production.id

  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-southeast-1b"
  map_public_ip_on_launch = true

  depends_on = [aws_internet_gateway.production-igw]

  tags = {
    "Name"        = "production-external-1b"
    "Environment" = "production"
  }
}

resource "aws_subnet" "production-external-1c" {
  vpc_id = aws_vpc.production.id

  cidr_block              = "10.0.3.0/24"
  availability_zone       = "ap-southeast-1c"
  map_public_ip_on_launch = true

  depends_on = [aws_internet_gateway.production-igw]

  tags = {
    "Name"        = "production-external-1c"
    "Environment" = "production"
  }
}
