# Launch Template for ecs cluster

resource "aws_launch_template" "launch_template" {
  name = "${var.env}-cluster-lt"

  description = "Launch Template to launch instances in ${var.env}-cluster"

  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.world-ssh.id]

  monitoring {
    enabled = true
  }

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = 30
    }
  }

  image_id = "ami-0c20b8b385217763f"

  instance_initiated_shutdown_behavior = "terminate"

  tag_specifications {
    resource_type = "instance"

    tags = {
      "Name"        = "ECS-${var.env}-cluster"
      "Environment" = var.env
    }
  }

  tags = {
    "Name"        = "${var.env}-cluster-lt"
    "Environment" = var.env
  }
}
