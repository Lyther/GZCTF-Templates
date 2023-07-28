#!/usr/bin/env bash

echo $GZCTF_FLAG > /flag.txt

chown 0:1337 /flag.txt /readflag && \
    chmod 040 /flag.txt && \
    chmod 2555 /readflag

export GZCTF_FLAG=not_flag
GZCTF_FLAG=not_flag

/etc/init.d/php7.4-fpm start && nginx -g 'daemon off;'