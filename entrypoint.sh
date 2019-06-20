#!/bin/sh
set -e
ss-server -p $SERVER_PORT -k $PASSWORD -t $TIMEOUT -m $METHOD -d $DNS_ADDRS -v -u --reuse-port
ss-server -p $SERVER_PORT -k $PASSWORD -t $TIMEOUT -m $METHOD -d $DNS_ADDRS -v -u --reuse-port
exec “$@”