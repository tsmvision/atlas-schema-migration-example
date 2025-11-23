#!/bin/sh

POSTGRES_USER_NAME="myuser"
POSTGRES_PASSWORD="mypassword"
POSTGRES_POD_NAME="my-postgresql"
POSTGRES_PORT="5432"
POSTGRES_DB_NAME="mydatabase"

## BEGIN wait until postgresql is up and running
echo "Waiting for postgresSql..."
until pg_isready -h my-postgresql.atlas-operator-ns.svc.cluster.local -p 5432 -U postgres; do
    echo "PostgresSql is unavailable - sleeping"
    sleep 3
done
echo "PostgresSql is up"
## END

## BEGIN db schema migration
atlas migrate hash
atlas migrate apply --url "postgres://${POSTGRES_USER_NAME}:${POSTGRES_PASSWORD}@${POSTGRES_POD_NAME}:${POSTGRES_PORT}/${POSTGRES_DB_NAME}?sslmode=disable" --dir file://migrations
## END

echo "PostgresSql migration is completed"
