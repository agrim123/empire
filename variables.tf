variable "env" {
  type = string
  default = "staging"
}

variable "external_subnets" {
  type = list(object({
    name              = string
    cidr_block        = string
    availability_zone = string
  }))

  default     = []
  description = "External subnets that needs to be created"
}

variable "internal_subnets" {
  type = list(object({
    name              = string
    cidr_block        = string
    availability_zone = string
  }))

  default     = []
  description = "Internal subnets that needs to be created"
}
