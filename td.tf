resource "aws_ecs_task_definition" "user_service" {
  family = "user_service"

  container_definitions = file("task-definitions/user_service.json")

  tags = {
    "Name"        = "user_service"
    "Environment" = var.env
  }
}
