FROM phusion/baseimage:0.9.15
MAINTAINER Marius Sturm <hello@torch.sh>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y curl && \
    curl -O -L https://packages.graylog2.org/releases/graylog2-omnibus/ubuntu/graylog2_latest.deb && \
    dpkg -i graylog2_latest.deb && \
    rm graylog2_latest.deb && \
    apt-get clean && \
    rm -rf /tmp/* /var/tmp/*

VOLUME /var/opt/graylog2/data
VOLUME /var/log/graylog2

# web interface
EXPOSE 9000
# gelf tcp
EXPOSE 12201
# gelf udp
EXPOSE 12201/udp
# rest api
EXPOSE 12900

CMD /opt/graylog2/embedded/bin/runsvdir-docker & \
    if [ ! -z "$GRAYLOG2_PASSWORD" ]; then graylog2-ctl set-admin-password $GRAYLOG2_PASSWORD; fi && \
    graylog2-ctl reconfigure && \
    tail -f /var/log/graylog2/server/current
