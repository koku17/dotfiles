#!/bin/bash
WEB_NAME="ssh_client"
TORRC="/tmp/etc/torrc"
DATADIR="/tmp/etc/data"

mkdir -p "$DATADIR"
chmod 700 "$HOSTDIR" "$DATADIR"

chroot
cat > "$TORRC" <<EOF
DataDirectory $DATADIR
$HiddenServiceDir $HOSTDIR
HiddenServicePort 80 127.0.0.1:8900
EOF
# Ommited Config Option
#SocksPort 0

tor -f "$TORRC" --verify-config && tor -f "$TORRC"
