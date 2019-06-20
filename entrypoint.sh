#!/bin/sh
set -e
nohup ss-server -p $SERVER_PORT -k $PASSWORD -t $TIMEOUT -m $METHOD -d $DNS_ADDRS -v -u --reuse-port >/var/log/shadowsocks.log 2>&1
nohup ss-server -p $SERVER_PORT -k $PASSWORD -t $TIMEOUT -m $METHOD -d $DNS_ADDRS -v -u --reuse-port >/var/log/shadowsocks.log 2>&1
exec “$@”