FROM alpine:3.4
MAINTAINER Tobias Brox <tobias@tobixen.no>

ENV VERSION  0.4.6
ENV CHECKSUM 946e8e4161f7ef84be42430b6e9d3bb7dd4bbbe241b409be208c14447d7aa7a6

ADD baikal.sh /usr/local/bin/baikal

RUN apk --no-cache add unzip openssl lighttpd php5-cgi php5-ctype php5-dom \
        php5-pdo_sqlite php5-pdo_mysql php5-xml php5-openssl php5-json \
        php5-xmlreader \
    && wget https://github.com/fruux/Baikal/releases/download/$VERSION/baikal-$VERSION.zip \
    && echo $CHECKSUM "" baikal*.zip | sha256sum -c - \
    && unzip baikal*.zip \
    && rm baikal*.zip \
    && chmod +x /usr/local/bin/baikal \
    && sed -ie "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g" /etc/php5/php.ini \
    && mkdir /baikal/html/.well-known \
    && apk del -rf --purge openssl unzip

ADD lighttpd.conf /etc/lighttpd/lighttpd.conf
ADD config.php /baikal/Specific/config.php
ADD config.system.php /baikal/Specific/config.system.php
ADD INSTALL_DISABLED /baikal/Specific/INSTALL_DISABLED
ADD db.sqlite /baikal/Specific/db/db.sqlite

## Baikal just throws an assertion error unless it has full write
## access on all files under baikal/Specific - including the config
## file, duh! :-( Letting the application having write access to
## php-files is a bad idea!  a+w also feels a bit wrong, though I'm not
## strong enough on openshift/docker to solve that the right way.
## openshift prefers running its "pods" with random user IDs.

RUN chmod -R a+w /baikal/Specific/

#VOLUME /baikal/Specific

EXPOSE 8080

ENTRYPOINT ["baikal"]
