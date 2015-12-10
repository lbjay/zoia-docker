#!/bin/bash

set -e
set -x

riofs -o allow_other $SUPYBOT_S3_BUCKET $SUPYBOT_HOME/zoia

ZOIA_CONFIG_FILE="${SUPYBOT_HOME}/zoia/zoia.conf"
cp -f ${ZOIA_CONFIG_FILE}.tmpl $ZOIA_CONFIG_FILE

sed -e "s/SUPYBOT_HOME/${SUPYBOT_HOME}/g" -i $ZOIA_CONFIG_FILE
sed -e "s/SUPYBOT_PASSWORD/${SUPYBOT_PASSWORD}/g" -i $ZOIA_CONFIG_FILE

supybot-adduser -u $SUPYBOT_OWNER_USERNAME -p $SUPYBOT_OWNER_PASSWORD -c owner $SUPYBOT_HOME/conf/users.conf

git clone $SUPYBOT_PLUGIN_REPO $SUPYBOT_HOME/plugins
    
exec supybot $ZOIA_CONFIG_FILE
