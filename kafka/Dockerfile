#FROM jarunj/openjdk8-jre
FROM alpine:latest

LABEL maintainer="Jarun Jiamtaweeboon"

COPY kafka_2.13-2.4.0.tgz /tmp/kafka_2.13-2.4.0.tgz

RUN apk update \
&& apk add --no-cache curl bash openjdk8-jre openssh jq \
&& cd /tmp \
&& tar xzf kafka_2.13-2.4.0.tgz \
&& mv /tmp/kafka_2.13-2.4.0 /opt/kafka \
&& adduser -DH -s /sbin/nologin kafka \
&& chown -R kafka: /opt/kafka \
&& rm -rf /tmp/* \
&& rm -rf /opt/kafka/config

#&& apk del --purge .build-deps


ENV PATH /sbin:/opt/kafka/bin/:$PATH

WORKDIR /opt/kafka

VOLUME ["/data/kafka"]
VOLUME ["/opt/kafka/config"]
VOLUME ["/opt/kafka/logs"]

COPY entry-point.sh /entry-point.sh
ENTRYPOINT ["/entry-point.sh"]

#EXPOSE 9092 2181


# COPY config/log4j.properties /opt/kafka/config/
#COPY config/server.properties /opt/kafka/config/
#COPY config/zookeeper.properties /opt/kafka/config/
#COPY kafka-entrypoint.sh /kafka-entrypoint.sh
#COPY scripts /

#ENTRYPOINT ["/kafka-entrypoint.sh"]
#CMD ["kafka-server-start.sh", "config/server.properties"]
