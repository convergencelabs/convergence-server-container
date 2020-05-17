##
## Builder Container
##
FROM alpine:3.9 as builder

# Convergence Server Configs
ENV CONVERGENCE_SERVER_VERSION 1.0.0-rc.6.1
ENV CONVERGENCE_SERVER_MD5 8026610de26b9017aae0a97e716d5a3b
ENV CONVERGENCE_SERVER_SHA1 c78a0157a6e3ddc5da51410e48d9bec8d4cdc262

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
FROM openjdk:11.0.4-jdk

LABEL maintainer="Convergence Labs, Inc."

ADD convergence-server.conf /etc/convergence/convergence-server.conf

COPY --from=builder /tmp/convergence-server /opt/convergence-server

COPY log4j2.xml /opt/convergence-server/conf/log4j2.xml
COPY convergence-server.conf /opt/convergence-server/conf/convergence-server.conf

EXPOSE 8080
EXPOSE 8081

WORKDIR /opt/convergence-server/

ENTRYPOINT ["/opt/convergence-server/bin/convergence-server"]
