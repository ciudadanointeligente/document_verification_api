#!/bin/bash

RAILS_ENV=production DISABLE_DATABASE_ENVIRONMENT_CHECK=1 rails db:drop
RAILS_ENV=production rails db:create
RAILS_ENV=production rails db:migrate
RAILS_ENV=production rails db:seed
RAILS_ENV=production rails s -p 3000 -b 0.0.0.0
# RAILS_ENV=production rails c
