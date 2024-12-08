variable "name" {
}

variable "region" {
}

variable "aws_vpc_id" {
}

variable "aws_subnet_a" {
}

variable "aws_subnet_b" {
}

variable "aws_db_instance_postgres_password" {
}

data "aws_vpc" "lab-vpc" {
  id = var.aws_vpc_id
}

data "aws_subnet" "lab-a" {
  id = var.aws_subnet_a
}

data "aws_subnet" "lab-b" {
  id = var.aws_subnet_b
}

data "aws_db_instance" "main" {
  db_instance_identifier = aws_db_instance.main.identifier
}
