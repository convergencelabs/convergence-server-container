#!/usr/bin/env sh

# Perpare the docker build
$(dirname "$0")/prepare.sh

# Run the docker build
docker build -t convergencelabs/convergence-server build