#!/bin/bash
set -ex
# set variables. It's presumed the absence of these is causing
# TRAVIS to fail
if [ "$TRAVIS" = "true" ]; then
  echo "INFO: this is travis - not running smoke test"
  bundle exec rake db:migrate
  bundle exec rake
  exit 0
fi
