#!/bin/bash

echo "setting env vars for document_verification_api launch"

SECRET_KEY_BASE=$(rails secret)
POSTGRESQL_PORT=5433
POSTGRESQL_USER=postgres
POSTGRESQL_PASSWORD=pgp4ss
RAILS_ENV=production
RAILS_PORT=3000

export SECRET_KEY_BASE
export POSTGRESQL_PORT
export POSTGRESQL_USER
export POSTGRESQL_PASSWORD
export RAILS_ENV
export RAILS_PORT

echo "starting document_verification_api"

docker-compose up -d

echo "document_verification_api started"
