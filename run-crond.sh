#!/bin/sh

crontab  /tmp/crontab

cron -L /var/log/cron/cron.log "$@" && tail -f /var/log/cron/cron.log
