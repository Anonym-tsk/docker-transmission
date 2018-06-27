#! /bin/sh
#
# entrypoint.sh

set -e

[[ "$DEBUG" == "true" ]] && set -x

groupmod -g $PGID -o transmission &> /dev/null
usermod -u $PUID -g $PGID -s /bin/bash -o transmission &> /dev/null

mkdir -p /config
chown -R transmission:transmission /config

su-exec transmission:transmission "$@"
