FROM phusion/baseimage:latest
MAINTAINER Jay Luker <lbjay@reallywow.com>

RUN apt-get update
RUN apt-get install -y python python-pip vim wget git
RUN pip install -U pip
RUN pip install supervisor
RUN pip install -r https://raw.githubusercontent.com/ProgVal/Limnoria/master/requirements.txt --user --upgrade
RUN pip install git+https://github.com/ProgVal/Limnoria.git@master --upgrade

ADD run.sh /run.sh
RUN chmod 755 /run.sh

RUN useradd -ms /bin/bash zoia
RUN git clone https://github.com/code4lib/supybot-plugins.git /home/zoia/supybot-plugins
ADD supybot /home/zoia/supybot
ADD supervisord.conf /home/zoia/supervisord.conf
RUN mkdir /home/zoia/supervisord
RUN chown -R zoia /home/zoia

USER zoia
CMD ["/run.sh"]
