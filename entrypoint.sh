#!/bin/sh
set -e
ss-server -p $SERVER_PORT -k $PASSWORD -t $TIMEOUT -m $METHOD -d $DNS_ADDRS $ARGS
exec “$@”