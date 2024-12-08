resource "postgresql_role" "test0" {
  name     = "test0"
  login    = true
  password = "test0"

  depends_on = [ 
    aws_db_instance.main 
  ]
}
