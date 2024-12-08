output "postgresql_schemas" {
  value = data.postgresql_schemas.postgres.schemas
}