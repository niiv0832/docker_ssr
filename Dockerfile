FROM alpine:latest
MAINTAINER niiv0832 <dockerhubme-ssr@yahoo.com>

RUN apk update && \
    apk upgrade && \
    apk --no-cache --virtual add python \
    libsodium \
    unzip \
    wget && \
    rm -rf /var/cache/apk/* && \
    wget --no-check-certificate https://github.com/niiv0832/shadowsocksr/archive/manyuser.zip -O /tmp/manyuser.zip && \
    unzip -d /tmp /tmp/manyuser.zip && \
    mv /tmp/shadowsocksr-manyuser/shadowsocks ~/shadowsocks && \
    rm -rf /tmp/* && \
    mkdir -p /etc/ssr/cfg

VOLUME ["/etc/ssr/cfg/"]

EXPOSE 80

WORKDIR ~/shadowsocks

CMD python ~/shadowsocks/server.py -c /etc/ssr/cfg/shadowsocks_r.json
