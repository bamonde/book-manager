#!/bin/bash

set -e

echo "ENTRYPOINT"

echo "BUNDLING"
bundle check || bundle install --jobs 2 --retry 5 --binstubs="$BUNDLE_BIN"

COMMAND="$1"

case "$COMMAND" in
  server)
    echo "RUNNING SERVER"
    sh -c "rm -f tmp/pids/server.pid && bundle exec rails s -b '0.0.0.0'"
    ;;
esac
