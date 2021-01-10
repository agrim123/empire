resource "aws_eip" "production-nat-eip-1a" {
  vpc = true
  depends_on = [ aws_internet_gateway.production-igw ]
}

resource "aws_eip" "production-nat-eip-1b" {
  vpc = true
  depends_on = [ aws_internet_gateway.production-igw ]
}

resource "aws_eip" "production-nat-eip-1c" {
  vpc = true
  depends_on = [ aws_internet_gateway.production-igw ]
}
