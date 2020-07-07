<div align="center">
  <img alt="Convergence Logo" height="80" src="https://convergence.io/assets/img/convergence-logo.png" >
</div>

# Convergence Server Container
[![Build Status](https://travis-ci.org/convergencelabs/convergence-server-container.svg?branch=master)](https://travis-ci.org/convergencelabs/convergence-server-container)

The Convergence Server provide the core services of the Convergence Realtime Collaboration Framework. Convergence enables developers to rapidly integrate realtime collaboration directly into their applications.

This repository contains the [OCI](https://www.opencontainers.org/) container build for the Convergence Server. It makes use of the Convergence Server Universal distribution that is published to [Maven Central](https://repo1.maven.org/maven2/com/convergencelabs/convergence-server-universal/).

## Convergence Admin User
In order to log into the Convergence Server for the first time, a default administrative user must be created (see the environment variables below). When the server starts up for the first time, it will create this user. On subsequent restarts, the Convergence Server will ensure that the user still exists and reset the password to the configured value.

## Configuration and Running
The container supports the following environment variables:
- **`DB_URI`**: Provides the URI to connect to the database.
- **`DB_ADMIN_USERNAME`**: The username of a database user that has privileges to create and remove databases.
- **`DB_ADMIN_PASSWORD`**: The password of a database user that has privileges to create and remove databases.
- **`CONVERGENCE_ADMIN_USERNAME`**: The username of default Convergence admin user.  The default is `admin`.
- **`CONVERGENCE_ADMIN_PASSWORD`**: The password of default Convergence admin user.  The default is `password`.
- **`CONVERGENCE_ADMIN_EMAIL`**: The email of default Convergence admin user. The default is `convergence@example.com`.
- **`CONVERGENCE_ADMIN_DISPLAY_NAME`**: The display name of default Convergence admin user. The default is `Server Admin`.
- **`REMOTING_BIND_HOSTNAME`**: The hostname Akka remoting will bind to. The default is `0.0.0.0`.
- **`REMOTING_BIND_PORT`**: The port Akka remote will bind to. The default is `25520`.
- **`REMOTING_EXTERNAL_HOSTNAME`**: The externally reachable hostname of this server instance. This is often required if the server is behind a proxy, or hosted in a container environment which uses DNS name mappings.  The default is `localhost`.
- **`REMOTING_EXTERNAL_PORT`**: The externally reachable port of this server instance. This is often required if the server is behind a proxy.  The default is `25520`.
- **`CONVERGENCE_SERVER_ROLES`**: Defines the functionality that this instance of the server will provide. A comma separated list can be provided. Valid values are: `backend`, `restApi`, and `realtimeApi`.
- **`CONVERGENCE_CLUSTER_SEEDS`**: A comma separated list of seed nodes in order for the server to join the cluster. This can be set to `localhost` if no cluster seeds are used and only one server container is run.
- **`CONVERGENCE_LOG4J_CONFIG_FILE`**: The path to an alternate log4j2.xml file to configure logging.

### Example Run Command
Running the container might look something like this:

```shell script
docker run --rm \
  --publish 25520:25520 \
  --publish 8080:8080 \
  --publish 8081:8081 \
  --env DB_URI="remote:orientdb:2424" \
  --env DB_ADMIN_USERNAME="root" \
  --env DB_ADMIN_PASSWORD="password" \
  --env CONVERGENCE_SERVER_ROLES="backend,restApi,realtimeApi" \
  --env CONVERGENCE_CLUSTER_SEEDS="localhost" \
  --link orientdb:orientdb \
  convergencelabs/convergence-server
```

*Note the use of `--link` see below for how to set up an orientdb container*

### Ports
- Port `25520` will be exposed to support akka remoting.
- If the `restApi` role is activated, the REST API will be served on port `8081`.
- If the `realtimeApi` role is activated, the Realtime API will be served on port `8080`.

### Orient DB
An [OrientDB](https://github.com/orientechnologies/orientdb) instance is required to run the Convergence Server.  The easies way to get one up and running is to run the following docker command:

```shell script
docker run --rm --name orientdb \
  -p 2424:2424 \
  -p 2480:2480 \
  -e ORIENTDB_ROOT_PASSWORD=password \
  orientdb:3.0.31
```

## Support
[Convergence Labs](https://convergencelabs.com) provides several different channels for support:

- Please use the [Convergence Community Forum](https://forum.convergence.io) for general and technical questions, so the whole community can benefit.
- For paid dedicated support or custom development services, [contact us](https://convergence.io/contact-sales/) directly.
- Chat with us on the [Convergence Public Slack](https://slack.convergence.io).
- Email <support@convergencelabs.com> for all other inquiries.

## License
The Convergence Server is licensed under the [GNU Public License v3](LICENSE) (GPLv3) license. Refer to the [LICENSE](LICENSE) for the specific terms and conditions of the license.

The Convergence Server is also available under a Commercial License. If you are interested in a non-open source license please contact us at [Convergence Labs](https://convergencelabs.com).
