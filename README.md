<div align="center">
  <img alt="Convergence Logo" height="80" src="https://convergence.io/assets/img/convergence-logo.png" >
</div>

# Convergence Server Container


## Convergence Admin User
In order to log into the Convergence Server for the first time, a default administrative user must be created (see the environment variables below). When the server starts up for the first time, it will create this user. On subsequent restarts, the Convergence Server will ensure that the user still exists and reset the password to the configured value.

## Configuration and Running
The container supports the following environment variables:
- `DB_URI`: Provides the URI to connect to the database.
- `DB_ADMIN_USERNAME`: The username of a database user that has privileges to create and remove databases.
- `DB_ADMIN_PASSWORD`: The password of a database user that has privileges to create and remove databases.
- `CONVERGENCE_ADMIN_USERNAME`: The username of default Convergence admin user.  The default is `admin`.
- `CONVERGENCE_ADMIN_PASSWORD`: The password of default Convergence admin user.  The default is `password`.
- `CONVERGENCE_ADMIN_EMAIL`: The email of default Convergence admin user. The default is `convergence@example.com`.
- `CONVERGENCE_ADMIN_DISPLAY_NAME`: The display name of default Convergence admin user. The default is `Server Admin`.
- `EXTERNAL_HOSTNAME`: The externally reachable hostname of this server instance. This is often required if the server is behind a proxy, or hosted in a container environment which uses DNS name mappings.  The default is `localhost`.
- `SERVER_ROLES`: Defines the functionality that this instance of the server will provide. A comma separated list can be provided. Valid values are: `backend`, `restApi`, and `realtimeApi`.
- `CLUSTER_SEED_NODES`: A comma separated list of seed nodes in order for the server to join the cluster. This can be set to `localhost` if no cluster seeds are used and only one server container is run.
- `LOG4J_CONFIG_FILE`: The path to an alternate log4j2.xml file to configure logging.

### Example Run Command
Running the container might look something like this:

```shell script
docker run --rm \
  --publish 2551:2551 \
  --publish 8080:8080 \
  --publish 8081:8081 \
  --env DB_URI="localhost:2424" \
  --env DB_ADMIN_USERNAME="root" \
  --env DB_ADMIN_PASSWORD="password" \
  --env EXTERNAL_HOSTNAME="localhost" \
  --env SERVER_ROLES="backend,restApi,realtimeApi" \
  --env CLUSTER_SEED_NODES="host1,host2" \
  convergencelabs/convergence-server
```

### Ports
- Port 2551 will be exposed to support akka remoting.
- If the `restApi` role is activated, the REST API will be served on port `8081`.
- If the `realtimeApi` role is activated, the Realtime API will be served on port `8080`.

## Support
[Convergence Labs](https://convergencelabs.com) provides several different channels for support:

- Please use the [Convergence Community Forum](https://forum.convergence.io) for general and technical questions, so the whole community can benefit.
- For paid dedicated support or custom development services, [contact us](https://convergence.io/contact-sales/) directly.
- Email <support@convergencelabs.com> for all other inquiries.

## License
The Convergence Server is licensed under the [GNU Public License v3](LICENSE) (GPLv3) license. Refer to the [LICENSE](LICENSE) for the specific terms and conditions of the license.

The Convergence Server is also available under a Commercial License. If you are interested in a non-open source license please contact us at [Convergence Labs](https://convergencelabs.com).