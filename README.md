<div align="center">
  <img alt="Convergence Logo" height="80" src="https://convergence.io/assets/img/convergence-logo.png" >
</div>

# Convergence Server Container


## Running
- `DB_URI`: 
- `DB_ADMIN_USERNAME`:
- `DB_ADMIN_PASSWORD`:
- `CONVERGENCE_ADMIN_USERNAME`:
- `CONVERGENCE_ADMIN_PASSWORD`:
- `CONVERGENCE_ADMIN_EMAIL`:
- `CONVERGENCE_ADMIN_DISPLAY_NAME`:
- `CONVERGENCE_ADMIN_DISPLAY_NAME`:
- `EXTERNAL_HOSTNAME`:
- `SERVER_ROLES`:
- `CLUSTER_SEED_NODES`:
- `LOG4J_CONFIG_FILE`:

To run the container execute the following command:

```shell script
docker run --rm \
  --publish 2551:2551 \
  --env DB_URI="localhost:2424" \
  --env DB_ADMIN_USERNAME="root" \
  --env DB_ADMIN_PASSWORD="password" \
  --env EXTERNAL_HOSTNAME="localhost" \
  --env SERVER_ROLES="backend,restApi,realtimeApi" \
  --env CLUSTER_SEED_NODES="localhost" \
  convergencelabs/convergence-server
```