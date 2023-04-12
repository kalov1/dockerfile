FROM ubuntu:18.04

RUN apt-get update && apt-get -y install \
    build-essential libpcre3 libpcre3-dev zlib1g zlib1g-dev libssl-dev wget

RUN wget http://nginx.org/download/nginx-1.15.12.tar.gz

RUN tar -xzvf nginx-1.15.12.tar.gz

WORKDIR nginx-1.15.12

RUN ./configure \
    --sbin-path=/usr/bin/nginx \
    --conf-path=/etc/nginx/nginx.conf \
    --error-log-path=/var/log/nginx/error.log \
    --http-log-path=/var/log/nginx/access.log \
    --with-pcre \
    --pid-path=/var/run/nginx.pid \
    --with-http_ssl_module

RUN make && make install
