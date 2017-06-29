#!/bin/bash

echo "setting env vars for document_verification_api launch"
echo "running as $(whoami)"

SECRET_KEY_BASE=16d582c02fc8aee3ca9a6fb3015ba521cba5577b1913140e3870124ca3dbe7a89d5b663c69ffb05118ac60b057a92f0df3aa414327876e8610728c132321ca25
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

docker-compose down
docker-compose up -d

echo "document_verification_api started"
