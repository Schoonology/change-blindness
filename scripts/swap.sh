#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

docker build -t change_blindness /vagrant
OLD_ID=`docker ps | grep change_blindness | awk '{ print $1 }'`
NEW_ID=`docker run -d -p 8080 --restart=on-failure change_blindness`
ADDR=`docker port $NEW_ID 8080`

cat > /etc/nginx/conf.d/change_blindness-upstream.conf <<EOF
upstream change_blindness {
  server  $ADDR  fail_timeout=10s;
}
EOF

service nginx reload

docker kill $OLD_ID
