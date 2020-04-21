FROM alpine:latest

LABEL maintainer="Jarun Jiamtaweeboon"

ENV SCALA_VERSION=2.13.1 \
    SCALA_HOME=/usr/share/scala

COPY scala-2.13.1.tgz /tmp/scala-2.13.1.tgz
#    wget --no-verbose "https://downloads.lightbend.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.tgz" && \

RUN apk add --no-cache --virtual=.build-dependencies wget ca-certificates && \
    apk add --no-cache bash curl openjdk11 openssh jq python3 git less && \
    cd "/tmp" && \
    tar xzf "scala-${SCALA_VERSION}.tgz" && \
    mkdir "${SCALA_HOME}" && \
    rm "/tmp/scala-${SCALA_VERSION}/bin/"*.bat && \
    mv "/tmp/scala-${SCALA_VERSION}/bin" "/tmp/scala-${SCALA_VERSION}/lib" "${SCALA_HOME}" && \
    ln -s "${SCALA_HOME}/bin/"* "/usr/bin/" && \
    apk del .build-dependencies && \
    rm -rf "/tmp/"*
 
COPY sbt-1.3.8.tgz /tmp/sbt-1.3.8.tgz
 #wget -qO - --no-check-certificate "https://piccolo.link/sbt-1.3.8.tgz" | tar xz -C /usr/local/sbt --strip-components=1 && \
 RUN export PATH="/usr/local/sbt/bin:$PATH" &&  \
 apk update && apk add ca-certificates wget tar && \
 mkdir -p "/usr/local/sbt" && \
 tar xzf /tmp/sbt-1.3.8.tgz -C /usr/local/sbt --strip-components=1 && \
 rm /tmp/sbt-1.3.8.tgz && \
 sbt sbtVersion

COPY entry-point.sh /entry-point.sh
ENTRYPOINT ["/entry-point.sh"]
