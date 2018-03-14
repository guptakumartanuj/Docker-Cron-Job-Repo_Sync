FROM ubuntu:16.06

MAINTAINER "Tanuj Gupta"

RUN apt-get update && apt install -y build-essential libmysqlclient-dev python-dev libapr1-dev libsvn-dev wget libcurl4-nss-dev libsasl2-dev libsasl2-modules zlib1g-dev curl

RUN apt-get install --no-install-recommends cron 

RUN apt-get update &&   DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends rsync &&     apt-get clean autoclean &&       apt-get autoremove -y &&         rm -rf /var/lib/apt/lists/*

RUN apt-get update

RUN apt-get install zip -y

COPY crontab /tmp/crontab

RUN chmod 755 /tmp/crontab

COPY run-crond.sh /run-crond.sh

RUN chmod -v +x /run-crond.sh

RUN mkdir -p /var/log/cron && touch /var/log/cron/cron.log

RUN mkdir -p /etc/crontabs

RUN chmod 755 /etc/crontabs && touch /etc/crontabs/root

RUN mkdir -p /tmp/azure/local

RUN mkdir -p /tmp/azure/dag

RUN curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip

RUN unzip rclone-current-linux-amd64.zip

WORKDIR rclone-v1.39-linux-amd64

RUN cp rclone /usr/bin/

RUN chown root:root /usr/bin/rclone

RUN chmod 755 /usr/bin/rclone

#RUN service cron start

RUN mkdir -p /root/.config/rclone 

RUN chmod 755 /root/.config/rclone

COPY rclone.conf /root/.config/rclone/

CMD ["/run-crond.sh"]
