#!/usr/bin/env sh


docker run \
  --name orientdb \
  -p 2424:2424 \
  -p 2480:2480 \
  -e ORIENTDB_ROOT_PASSWORD=password \
  orientdb:3.0.37