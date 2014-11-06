#!/bin/bash

set -e
set -x

ZOIA_CONFIG_FILE="/home/zoia/zoia.conf"

sed -e "s/FREENODE_PASSWORD/${FREENODE_PASSWORD}/g" \
    -i $ZOIA_CONFIG_FILE
    
/usr/local/bin/supervisord -c /etc/supervisord.conf
