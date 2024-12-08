resource "postgresql_role" "test0" {
  name     = "test0"
  login    = true
  password = "test0"

  depends_on = [ 
    aws_db_instance.main 
  ]
}

resource "aws_iam_policy" "test0" {
  name        = "tf-RDSUser-test0"
  description = "Policy allowing RDS IAM authentication for user test0"
  policy      = <<EOF
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Action": "rds-db:connect",
          "Effect": "Allow",
          "Resource": "arn:aws:rds-db:${var.region}:${data.aws_caller_identity.current.account_id}:dbuser:${data.aws_db_instance.main.resource_id}/test0"
        }
      ]
    }
  EOF
  tags = {
    "managed-by" = "terraform"
  }
}
