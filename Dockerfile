FROM libcrack/limnoria
MAINTAINER Jay Luker <lbjay@reallywow.com>

USER root

RUN apt-get update && \
    apt-get -y install build-essential gcc make automake autoconf \
               libtool pkg-config intltool libglib2.0-dev libfuse-dev \
               libxml2-dev libevent-dev libssl-dev fuse

RUN git clone https://github.com/skoobe/riofs.git /riofs && \
    cd /riofs && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make install && \
    rm -rf /riofs

RUN echo "user_allow_other\n" > /etc/fuse.conf

COPY run.sh run.sh

ENV SUPYBOT_PLUGIN_REPO https://github.com/code4lib/supybot-plugins.git
ENV SUPYBOT_S3_BUCKET zoia-docker

USER supybot
RUN mkdir zoia
RUN mkdir logs

CMD ["run.sh"]
