resource "aws_security_group" "world-ssh" {
  name        = "world-ssh"
  description = "Allow all ssh inbound traffic"

  vpc_id                 = aws_vpc.vpc.id
  revoke_rules_on_delete = true

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "All traffic"
    protocol    = "tcp"
    self        = false
    from_port   = 22
    to_port     = 22
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "All traffic"
    protocol    = -1
    self        = false
    from_port   = 0
    to_port     = 0
  }

  tags = {
    "Name"        = "world-ssh"
    "Environment" = var.env
  }
}
