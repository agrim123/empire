resource "aws_ecs_cluster" "ecs" {
  name = "${var.env}-cluster"

  capacity_providers = [ aws_ecs_capacity_provider.capacity_provider.name ]

  setting {
    name = "containerInsights"
    value = "disabled"
  }

  tags = {
    "Name" = "${var.env}-cluster"
    "Environment" = var.env
  }
}
