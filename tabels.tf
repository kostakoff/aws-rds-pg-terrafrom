resource "postgresql_database" "test0" {
  name                   = "test0"
  owner                  = "test0"
  template               = "template0"
  lc_collate             = "C"
  connection_limit       = 360
  allow_connections      = true
  alter_object_ownership = true

  depends_on = [ 
    aws_db_instance.main,
    postgresql_role.test0
  ]
}
