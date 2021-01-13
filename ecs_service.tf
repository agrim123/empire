resource "aws_ecs_service" "user_service" {
  name = "user_service"

  cluster         = aws_ecs_cluster.ecs.id
  task_definition = aws_ecs_task_definition.user_service.arn
  desired_count   = 0

  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }

  ordered_placement_strategy {
    type  = "binpack"
    field = "memory"
  }

  scheduling_strategy = "REPLICA"
#   launch_type         = "EC2"

  capacity_provider_strategy {
    capacity_provider = aws_ecs_capacity_provider.capacity_provider.name
    weight            = 1
  }

  tags = {
    "Name"        = "user_service"
    "Environment" = var.env
  }
}
