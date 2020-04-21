FROM alpine:latest

LABEL maintainer="Jarun Jiamtaweeboon"

COPY apache-zookeeper-3.5.7-bin.tar.gz /tmp/apache-zookeeper-3.5.7-bin.tar.gz

RUN apk update \
&& apk add --no-cache curl bash openjdk8-jre openssh jq \
&& cd /tmp \
&& tar xzf apache-zookeeper-3.5.7-bin.tar.gz \
&& mv /tmp/apache-zookeeper-3.5.7-bin /opt/zookeeper \
&& adduser -DH -s /sbin/nologin zk \
&& chown -R zk: /opt/zookeeper \
&& rm -rf /tmp/* \
&& rm -rf /opt/zookeeper/conf

#&& apk del --purge .build-deps


ENV PATH /sbin:/opt/zookeeper/bin/:$PATH

WORKDIR /opt/zookeeper

VOLUME ["/data/zookeeper"]
VOLUME ["/opt/zookeeper/conf"]
VOLUME ["/opt/zookeeper/logs"]

#EXPOSE 2181

COPY entry-point.sh /entry-point.sh
ENTRYPOINT ["/entry-point.sh"]
