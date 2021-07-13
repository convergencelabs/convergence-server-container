##
## Builder Container
##
FROM alpine:3.14 as builder

# Convergence Server Configs
ENV CONVERGENCE_SERVER_VERSION 1.0.0-rc.10
ENV CONVERGENCE_SERVER_MD5 9099a51ab9b001c767dbf2b6394eb33b
ENV CONVERGENCE_SERVER_SHA1 9099fdc185aefc8061749cc945c2a5a4e5bb4e7f

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

ADD convergence-server.conf /etc/convergence/convergence-server.conf

COPY --from=builder /tmp/convergence-server /opt/convergence-server

COPY log4j2.xml /opt/convergence-server/conf/log4j2.xml
COPY convergence-server.conf /opt/convergence-server/conf/convergence-server.conf

EXPOSE 8080
EXPOSE 8081
EXPOSE 25520

WORKDIR /opt/convergence-server/

ENTRYPOINT ["/opt/convergence-server/bin/convergence-server"]
