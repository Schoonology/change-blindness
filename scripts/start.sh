#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

docker build -t change_blindness /vagrant
NEW_ID=`docker run -d -p 8080 change_blindness`
ADDR=`docker port $NEW_ID 8080`

cat > /etc/nginx/conf.d/change_blindness-upstream.conf <<EOF
upstream change_blindness {
  server  $ADDR  fail_timeout=10s;
}
EOF

service nginx reload
