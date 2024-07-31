FROM adoptopenjdk/openjdk8-openj9:x86_64-alpine-jdk8u332-b09_openj9-0.32.0

ENV LANG=C.UTF-8 \
    TZ="Asia/Shanghai" \
    TINI_VERSION="v0.18.0"


# Install base packages


RUN apk add --no-cache tini \
#   freetype-dev \  
    --update ttf-dejavu fontconfig \ 
     && rm -rf /var/cache/apk/*

      
#放入公共依赖的文件
WORKDIR /data/skyagent/agent/agent
COPY ./agent /data/skyagent/agent/agent


WORKDIR /data/prometheus

COPY ./jmx_prometheus_javaagent-0.17.0.jar ./jmx_prometheus_javaagent-0.12.0.jar
COPY ./config.yaml ./

WORKDIR /data/arthas
RUN wget https://arthas.gitee.io/arthas-boot.jar
ENTRYPOINT ["tini", "--"]
