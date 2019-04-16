#!/bin/bash
set -e
echo "Start ssh"
service ssh start
if [[ -z ${1} ]]; then
  echo "Run squid"
  exec $(which squid) -f /etc/squid/squid.conf -NYCd 1
else
  echo "Start squid"
  exec $(which squid) restart
  echo "Extra commands..."
  exec "$@"
fi