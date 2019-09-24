#!/bin/bash

cat > /etc/vpnc/default.conf <<EOF
IPSec gateway ${VPNC_GATEWAY}
IPSec ID ${VPNC_ID}
IPSec secret ${VPNC_SECRET}
Xauth username ${VPNC_USERNAME}
Xauth password ${VPNC_PASSWORD}
DPD idle timeout (our side) 300
EOF

if [ -z "$CUSTOMSCRIPT" ]
then
  echo "\$CUSTOMSCRIPT is empty"
  /usr/sbin/vpnc default --no-detach --non-inter --local-port 0
else 
  source /custom-script.source
fi