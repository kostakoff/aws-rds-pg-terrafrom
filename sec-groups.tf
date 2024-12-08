resource "aws_security_group" "rds-default" {
  name = "${var.name}-default-security-group"
  description = "Default security group for ${var.name}"
  vpc_id = data.aws_vpc.lab-vpc.id
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 5432
    to_port = 5432
    protocol = "TCP"
  }
  tags = {
    "Name" = var.name
    "managed-by" = "terraform"
  }
}
