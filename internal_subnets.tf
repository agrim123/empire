resource "aws_subnet" "production-internal-1a" {
  vpc_id = aws_vpc.production.id

  cidr_block        = "10.0.4.0/24"
  availability_zone = "ap-southeast-1a"

  tags = {
    "Name"        = "production-internal-1a"
    "Environment" = "production"
  }
}

resource "aws_subnet" "production-internal-1b" {
  vpc_id = aws_vpc.production.id

  cidr_block        = "10.0.5.0/24"
  availability_zone = "ap-southeast-1b"

  tags = {
    "Name"        = "production-internal-1b"
    "Environment" = "production"
  }
}

resource "aws_subnet" "production-internal-1c" {
  vpc_id = aws_vpc.production.id

  cidr_block        = "10.0.6.0/24"
  availability_zone = "ap-southeast-1c"

  tags = {
    "Name"        = "production-internal-1c"
    "Environment" = "production"
  }
}
