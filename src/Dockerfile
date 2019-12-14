FROM openjdk:11.0.4-jdk

ADD convergence-server.conf /etc/convergence/convergence-server.conf

COPY convergence-server.tgz /tmp/convergence-server.tgz
RUN mkdir -p /opt/convergence && \
    tar -zxvf /tmp/convergence-server.tgz -C /opt/convergence --strip-components=1 && \
    chmod +x /opt/convergence/bin/convergence-server && \
    rm -rf /tmp/convergence-server.tgz

COPY log4j2.xml /opt/convergence/etc/log4j2.xml
COPY convergence-server.conf /opt/convergence/conf/convergence-server.conf

EXPOSE 8080
EXPOSE 8081

WORKDIR /opt/convergence/

ENTRYPOINT ["/opt/convergence/bin/convergence-server"]

CMD ["-c", "/opt/convergence/conf/convergence-server.conf", "-Dlog4j.configurationFile=/opt/convergence/conf/log4j2.xml"]
