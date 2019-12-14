#!/usr/bin/env sh

# Perpare the docker build
./prepare.sh

# Run the docker build
docker build -t convergencelabs/convergence-server build