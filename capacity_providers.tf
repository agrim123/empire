resource "aws_ecs_capacity_provider" "capacity_provider" {
  name = "${var.env}-cluster-cp"

  auto_scaling_group_provider {
    auto_scaling_group_arn         = aws_autoscaling_group.asg.arn
    managed_termination_protection = "ENABLED"

    managed_scaling {
      target_capacity = 100
      status          = "ENABLED"
    }
  }

  tags = {
    "Name"        = "${var.env}-cluster-cp"
    "Environment" = var.env
  }
}
