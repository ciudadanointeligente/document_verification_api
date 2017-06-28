FROM ruby:2.4.0

MAINTAINER Jordi Bari <jbari@ciudadanointeligente.org>

# Install dependencies:
# - build-essential: To ensure certain gems can be compiled
# - nodejs: Compile assets
# - libpq-dev: Communicate with postgres through the postgres gem
# - postgresql-client-9.4: In case you want to talk directly to postgres
RUN apt-get update && apt-get install -qq -y build-essential nodejs libpq-dev postgresql-client --fix-missing --no-install-recommends

ENV INSTALL_PATH /document_verification_api

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY . .

VOLUME ["$INSTALL_PATH/lib/seeds"]


ENV BUNDLE_GEMFILE=$INSTALL_PATH/Gemfile \
  BUNDLE_JOBS=2 \
  BUNDLE_PATH=/bundle


# The default command that gets ran will be to start the Unicorn server.
# CMD  bundle install \
#    && RAILS_ENV=$RAILS_ENV bundle exec rails db:drop \
#    && RAILS_ENV=$RAILS_ENV bundle exec rails db:create \
#    && RAILS_ENV=$RAILS_ENV bundle exec rails db:migrate \
#    && RAILS_ENV=$RAILS_ENV bundle exec rails db:seed \
#    && RAILS_ENV=$RAILS_ENV bundle exec rails server -b 0.0.0.0 -p 3000
CMD RAILS_ENV=$RAILS_ENV bundle exec rails server -b 0.0.0.0 -p 3000
