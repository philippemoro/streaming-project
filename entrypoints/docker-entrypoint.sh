#!/bin/sh

set -e

if [ "$DOCKER_STAGE" == "development" ]; then bundle check || bundle install --jobs 4 --retry 3; fi

$@
