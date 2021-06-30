#!/usr/bin/env sh

# Assumes an OrientDB container is running under the name orientdb on port 2424.

# Run the container
docker run --rm \
  --publish 2551:2551 \
  --publish 8080:8080 \
  --publish 8081:8081 \
  --env DB_URI="remote:orientdb:2424" \
  --env DB_ADMIN_USERNAME="root" \
  --env DB_ADMIN_PASSWORD="password" \
  --env CONVERGENCE_SERVER_ROLES="backend,restApi,realtimeApi" \
  --env CONVERGENCE_CLUSTER_SEEDS="localhost" \
  --link orientdb:orientdb \
  convergencelabs/convergence-server