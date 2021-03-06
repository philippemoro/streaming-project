#!/bin/sh

set -e

if [ -z "$RAILS_ENV" ]; then export RAILS_ENV="development"; fi

if [ "$RAILS_ENV" == "development" ]; then
    bundle
    bin/rake db:prepare
    rm -f tmp/pids/server.pid
    bundle exec rails s -p 3000 -b '0.0.0.0'
fi

# Prepare database.
bin/rake db:prepare
