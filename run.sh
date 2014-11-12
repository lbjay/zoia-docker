#!/bin/bash

set -e
set -x

ZOIA_CONFIG_FILE="/home/zoia/supybot/zoia.conf"

sed -e "s/FREENODE_PASSWORD/${FREENODE_PASSWORD}/g" \
    -i $ZOIA_CONFIG_FILE

supybot-adduser -u $SUPYBOT_OWNER_USERNAME -p $SUPYBOT_OWNER_PASSWORD -c owner /home/zoia/supybot/conf/users.conf
    
/usr/local/bin/supervisord -c /home/zoia/supervisord.conf
