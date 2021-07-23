##
## Builder Container
##
FROM alpine:3.14 as builder

# Convergence Server Configs
ENV CONVERGENCE_SERVER_VERSION 1.0.0-rc.12
ENV CONVERGENCE_SERVER_MD5 0c3829216bee4fc49b9eca2d1823110d
ENV CONVERGENCE_SERVER_SHA1 985c2c762be51bfe3e015614f4c01a741df6c968

# Install utils
RUN apk add --update tar curl

# Download the Convergence Server Universal Distribution
COPY download-convergence-server.sh /tmp
RUN chmod 755 /tmp/download-convergence-server.sh && /tmp/download-convergence-server.sh
RUN mkdir /tmp/convergence-server
RUN tar -zxvf /tmp/convergence-server.tgz -C /tmp/convergence-server --strip-components=1

##
## Runtime Container
##
FROM openjdk:11.0.11-9-jdk

LABEL maintainer="Convergence Labs, Inc."

## Create convergence group and user to run as a non root user.
RUN groupadd -g 5000 convergence && \
    useradd -u 5000 -g convergence convergence

COPY convergence-server.conf /etc/convergence/convergence-server.conf

COPY --from=builder /tmp/convergence-server /opt/convergence-server

COPY log4j2.xml /opt/convergence-server/conf/log4j2.xml
COPY convergence-server.conf /opt/convergence-server/conf/convergence-server.conf

RUN chown -R convergence:convergence /opt/convergence-server && \
    chown -R convergence:convergence /etc/convergence

EXPOSE 8080
EXPOSE 8081
EXPOSE 25520

WORKDIR /opt/convergence-server/

## Execute as the convergence user.
USER convergence

ENTRYPOINT ["/opt/convergence-server/bin/convergence-server"]