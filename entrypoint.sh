#!/bin/sh

if [ -e /etc/logrotate.conf ]; then
  echo "Using mounted /etc/logrotate.conf:" 
else
  echo "include /etc/logrotate.d"  >> /etc/logrotate.conf
fi

  
  echo "${DOCKER_CRON_SCHEDULE} ${DOCKER_COMMAND}" >> /etc/crontabs/root
  echo "${LOGROTATE_CRON_SCHEDULE} /usr/sbin/logrotate -v /etc/logrotate.conf" >> /etc/crontabs/root


exec crond   -f 2>&1
