resource "aws_db_subnet_group" "main" {
  name       = var.name
  subnet_ids = [
    data.aws_subnet.lab-a.id,
    data.aws_subnet.lab-b.id
  ]

  tags = {
    Name = var.name
  }
}

resource "aws_db_instance" "main" {
  allocated_storage           = 50
  auto_minor_version_upgrade  = true
  apply_immediately = true
  db_subnet_group_name        = aws_db_subnet_group.main.name
  engine                      = "postgres"
  engine_version              = "16.6"
  identifier                  = var.name
  instance_class              = "db.t3.medium"
  multi_az                    = true
  iam_database_authentication_enabled = true
  password                    = var.aws_db_instance_postgres_password
  username                    = "postgres"
  db_name = "postgres"
  storage_encrypted           = false
  engine_lifecycle_support = "open-source-rds-extended-support-disabled"
  skip_final_snapshot = true
  network_type = "IPV4"
  storage_type = "standard"
  vpc_security_group_ids = [ aws_security_group.rds-default.id ]
  publicly_accessible = false

  depends_on = [ 
    aws_db_subnet_group.main 
  ]
}
