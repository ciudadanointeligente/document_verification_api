FROM ruby:2.4.0

MAINTAINER Jordi Bari <jbari@ciudadanointeligente.org>

# Install dependencies:
# - build-essential: To ensure certain gems can be compiled
# - nodejs: Compile assets
# - libpq-dev: Communicate with postgres through the postgres gem
# - postgresql-client-9.4: In case you want to talk directly to postgres
RUN apt-get update && apt-get install -qq -y build-essential nodejs libpq-dev postgresql-client --fix-missing --no-install-recommends

# Set an environment variable to store where the app is installed to inside
# of the Docker image.
ENV INSTALL_PATH /document_verification_api
RUN mkdir -p $INSTALL_PATH

# This sets the context of where commands will be ran in and is documented
# on Docker's website extensively.
WORKDIR $INSTALL_PATH

# Ensure gems are cached and only get updated when they change. This will
# drastically increase build times when your gems do not change.
# COPY Gemfile Gemfile
# RUN bundle install

# Copy in the application code from your work station at the current directory
# over to the working directory.
COPY . .

# Provide dummy data to Rails so it can pre-compile assets.
# RUN RAILS_ENV=production rails assets:precompile

# RUN RAILS_ENV=production rails db:migrate

# Expose a volume so that nginx will be able to read in assets in production.
VOLUME ["$INSTALL_PATH/public"]

# --- Add this to your Dockerfile ---
ENV BUNDLE_GEMFILE=$INSTALL_PATH/Gemfile \
  BUNDLE_JOBS=2 \
  BUNDLE_PATH=/bundle

RUN bundle install \
    && bundle exec rails db:drop \
    && bundle exec rails db:create \
    && bundle exec rails db:migrate \
    && bundle exec rails db:seed

# The default command that gets ran will be to start the Unicorn server.
CMD  bundle exec rails server -b 0.0.0.0 -p 3000

# The default command that gets ran will be to start the Unicorn server.
#CMD RAILS_ENV=production bundle exec rails db:create \
#    && RAILS_ENV=production bundle exec rails db:migrate \
#    && RAILS_ENV=production bundle exec rails db:seed \
#    && RAILS_ENV=production bundle exec puma
