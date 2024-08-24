#!/bin/sh

: "${TINYPROXY_PORT:=8888}"
: "${TINYPROXY_CONFIG_FILE:="/etc/tinyproxy/tinyproxy.conf"}"

export TINYPROXY_PORT TINYPROXY_CONFIG_FILE

if ! [ -f "$TINYPROXY_CONFIG_FILE" ]; then
  mkdir -p "$(dirname "$TINYPROXY_CONFIG_FILE")"
  cat >"$TINYPROXY_CONFIG_FILE" <<EOF
Port ${TINYPROXY_PORT}
EOF
fi

exec "$@"
