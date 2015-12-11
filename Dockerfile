FROM obosob/supybot

MAINTAINER Jay Luker <lbjay@reallywow.com>

USER root

RUN apt-get update && \
    apt-get -y install python-pip libsqlite0-dev libsqlite3-dev && \
    apt-get -y autoremove

RUN pip install -r https://raw.githubusercontent.com/code4lib/supybot-plugins/master/requirements.txt

USER supybot
