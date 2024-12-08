terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
    postgresql = {
      source = "cyrilgdn/postgresql"
      version = "1.25.0"
    }
  }
}

provider "aws" {
  region = var.region
}

provider "postgresql" {
  scheme   = "awspostgres"
  host     = data.aws_db_instance.main.address
  username = "postgres"
  database = "postgres"
  port     = data.aws_db_instance.main.port
  password = var.aws_db_instance_postgres_password
  sslmode         = "require"

  superuser = false
}

data "postgresql_schemas" "postgres" {
  database = "postgres"
  depends_on = [ 
    aws_db_instance.main
  ]
}