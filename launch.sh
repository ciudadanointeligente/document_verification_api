#!/bin/bash

export SECRET_KEY_BASE=$(rails secret)
export POSTGRESQL_PORT=5433
export POSTGRESQL_USER=postgres
export POSTGRESQL_PASSWORD=pgp4ss
export RAILS_ENV=production
export RAILS_PORT=3000

docker-compose up -d
