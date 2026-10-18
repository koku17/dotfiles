#!/bin/bash
WEB_NAME="p2chat"
HOSTDIR="/tmp/tor-data/$WEB_NAME"
TORRC="/tmp/tor-data/torrc"
DATADIR="/tmp/tor-data/data"

mkdir -p "$HOSTDIR" "$DATADIR"
chmod 700 "$HOSTDIR" "$DATADIR"

cat > "$TORRC" <<EOF
DataDirectory $DATADIR
HiddenServiceDir $HOSTDIR
HiddenServicePort 80 127.0.0.1:59000
EOF
# Ommited Config Option
#SocksPort 0

tor -f "$TORRC" --verify-config && tor -f "$TORRC"
