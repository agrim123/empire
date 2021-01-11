resource "aws_instance" "production-entry" {
  ami                     = "ami-0c20b8b385217763f"
  instance_type           = "t2.micro"
  security_groups         = [aws_security_group.world-ssh.id]
  disable_api_termination = true
  #   key_name = aws_key_pair.production-entry.key_name
  monitoring = false
  subnet_id  = aws_subnet.internal_subnets[0].id

  tags = {
    "Name"        = "${var.env}-entry"
    "Environment" = var.env
  }
}
