resource "aws_autoscaling_group" "asg" {
  name = "${var.env}-cluster-asg"

  max_size         = 5
  min_size         = 0
  desired_capacity = 0

  vpc_zone_identifier = [aws_subnet.internal_subnets[0].id]

  protect_from_scale_in = true

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = "$Latest"
  }

  tags = [
    {
      key                 = "Name"
      value               = "${var.env}-cluster-asg"
      propagate_at_launch = true
    },
    {
      key                 = "Environment"
      value               = var.env
      propagate_at_launch = true
    },
    {
      key                 = "AmazonECSManaged"
      value               = ""
      propagate_at_launch = true
    }
  ]
}
