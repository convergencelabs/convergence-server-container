#!/usr/bin/env sh

# expor the container
docker save convergencelabs/convergence-server:latest | gzip > convergence-server.tgz