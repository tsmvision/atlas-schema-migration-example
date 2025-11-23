env "local" {
  url = "postgres://myuser:mypassword@my-postgresql:5432/mydatabase?sslmode=disable"
  src = "file://migrations"
}
