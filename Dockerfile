FROM alpine:3.7
MAINTAINER anonym.tsk@gmail.com

ENV PUID        1000
ENV PGID        1000
ENV RPC_PORT    9091
ENV PEERPORT    51413
ENV USERNAME    transmission
ENV PASSWORD    transmission

# Install packaged and files
RUN set -xe && \
    apk add --no-cache --repository http://nl.alpinelinux.org/alpine/edge/main transmission-daemon && \
    apk add --no-cache bash tar curl shadow su-exec && \
    cd /tmp && \
    curl -sSL https://github.com/ronggang/transmission-web-control/archive/v1.6.0-alpha.tar.gz | tar xz --strip 1 && \
    cp /usr/share/transmission/web/index.html /usr/share/transmission/web/index.original.html && \
    cp -rf /tmp/src/* /usr/share/transmission/web/ && \
    apk del tar curl && \
    rm -rf /tmp/*

COPY entrypoint.sh /usr/bin/entrypoint.sh

VOLUME /config

EXPOSE $RPC_PORT $PEERPORT $PEERPORT/UDP

ENTRYPOINT ["/usr/bin/entrypoint.sh"]

CMD /usr/bin/transmission-daemon \
                        --foreground \
                        --config-dir /config \
                        --port $RPC_PORT \
                        --peerport $PEERPORT \
                        --username $USERNAME \
                        --password $PASSWORD
