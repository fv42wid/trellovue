#!/bin/bash
set -e

# remove a potentially pre-existing server.pid for rails
rm -f /trello/tmp/pids/server.pid

# then exec the container's main process
exec "$@"
