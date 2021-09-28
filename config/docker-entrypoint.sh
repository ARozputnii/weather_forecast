#!/bin/sh
# Exit on fail
set -e

bundle exec bundle install

exec "$@"