#!/bin/sh

## BEGIN wait until postgresql is up and running
echo "Waiting for postgresSql..."
until pg_isready -h my-postgresql.atlas-operator-ns.svc.cluster.local -p 5432 -U postgres; do
    echo "PostgresSql is unavailable - sleeping"
    sleep 3
done
echo "PostgresSql is up"
## END

atlas migrate hash
atlas migrate apply --url "postgres://myuser:mypassword@my-postgresql:5432/mydatabase?sslmode=disable" --dir file://migrations

echo "PostgresSql migration is completed"
