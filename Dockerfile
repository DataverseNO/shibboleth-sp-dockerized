#Dockerfile
FROM httpd:2.4

LABEL maintainer="UIT"

RUN apt update && apt -y upgrade

COPY httpd-shibd-foreground /usr/local/bin/
RUN chmod +x /usr/local/bin/httpd-shibd-foreground

RUN apt install -y --no-install-recommends wget \
     libapache2-mod-shib \
     shibboleth-sp-utils

RUN apt update && apt -y upgrade && apt install -y --no-install-recommends libapache2-mod-shib shibboleth-sp-utils

## Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


CMD ["httpd-shibd-foreground"]
