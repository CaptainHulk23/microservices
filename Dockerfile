FROM alpine:3.12

RUN set -x \
  && apk add --no-cache logrotate tini tzdata moreutils \
  && rm /etc/logrotate.conf && rm -r /etc/logrotate.d \  
  && mv /etc/periodic/daily/logrotate /etc/.logrotate.cronjob

COPY entrypoint.sh /entrypoint.sh



ENTRYPOINT ["tini", "-g", "--"]
CMD ["/entrypoint.sh"]
