#Dockerfile
FROM httpd:2.4

LABEL maintainer="UIT"

RUN apt-get update && apt-get -y --no-install-recommends upgrade

COPY httpd-shibd-foreground /usr/local/bin/
COPY shibd /etc/logrotate.d/

RUN chmod +x /usr/local/bin/httpd-shibd-foreground

RUN apt-get install -y --no-install-recommends wget \
     curl \
     cron \
     logrotate \
     libapache2-mod-shib \
     shibboleth-sp-utils \
     libapache2-mod-security2

## Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


CMD ["httpd-shibd-foreground"]
