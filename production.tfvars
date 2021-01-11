env = "production"

external_subnets = [
  {
    name = "production-external-1a"
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-southeast-1a"
  },
  {
    name = "production-external-1b"
    cidr_block = "10.0.2.0/24"
    availability_zone = "ap-southeast-1b"
  },
  {
    name = "production-external-1c"
    cidr_block = "10.0.3.0/24"
    availability_zone = "ap-southeast-1c"
  }
]

internal_subnets = [
  {
    name = "production-internal-1a"
    cidr_block = "10.0.4.0/24"
    availability_zone = "ap-southeast-1a"
  },
  {
    name = "production-internal-1b"
    cidr_block = "10.0.5.0/24"
    availability_zone = "ap-southeast-1b"
  },
  {
    name = "production-internal-1c"
    cidr_block = "10.0.6.0/24"
    availability_zone = "ap-southeast-1c"
  }
]
