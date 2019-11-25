FROM golang:alpine AS golang

ENV V2RAY_PLUGIN_VERSION v1.2.0
ENV GO111MODULE on

# Build v2ray-plugin
RUN apk -U upgrade --no-cache \
    && apk add --no-cache git build-base \
    && mkdir -p /go/src/github.com/shadowsocks \
    && cd /go/src/github.com/shadowsocks \
    && git clone https://github.com/shadowsocks/v2ray-plugin.git \
    && cd v2ray-plugin \
    && git checkout "$V2RAY_PLUGIN_VERSION" \
    && go get -d \
    && go build

FROM shadowsocks/shadowsocks-libev:edge

USER root
# Copy v2ray-plugin
RUN apk upgrade -U --no-cache

USER nobody
COPY --from=golang /go/src/github.com/shadowsocks/v2ray-plugin/v2ray-plugin /usr/local/bin

ENV SERVER_PORT 8388
ENV PASSWORD PleaseChangeThis
ENV METHOD xchacha20-ietf-poly1305
ENV TIMEOUT 300
ENV DNS_ADDRS 1.1.1.1
ENV ARGS -u -v

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
