# Running locally:
# 1) echo 'hxp{FLAG}' > flag.txt
# 2) docker build -t includers_revenge .
# 3) docker run -p 8088:80 --rm -it includers_revenge

FROM debian:bullseye

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -y \
        nginx \
        php-fpm \
    && rm -rf /var/lib/apt/lists/

RUN rm -rf /var/www/html/*
COPY docker-stuff/default /etc/nginx/sites-enabled/default
COPY docker-stuff/www.conf /etc/php/7.4/fpm/pool.d/www.conf

#  # Permission
#  7 rwx
#  6 rw-
#  5 r-x
#  4 r--
#  3 -wx
#  2 -w-
#  1 --x
#  0 ---

COPY flag.txt docker-stuff/readflag /

COPY index.php /var/www/html/
RUN chown -R root:root /var/www && \
    find /var/www -type d -exec chmod 555 {} \; && \
    find /var/www -type f -exec chmod 444 {} \; && \
    chown -R root:root /tmp /var/tmp /var/lib/php/sessions && \
    chmod -R 000 /tmp /var/tmp /var/lib/php/sessions

RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

RUN find / -ignore_readdir_race -type f \( -perm -4000 -o -perm -2000 \) -not -wholename /readflag -delete
USER www-data
RUN (find --version && id --version && sed --version && grep --version) > /dev/null
RUN ! find / -writable -or -user $(id -un) -or -group $(id -Gn|sed -e 's/ / -or -group /g') 2> /dev/null | grep -Ev -m 1 '^(/dev/|/run/|/proc/|/sys/|/var/lock|/var/log/nginx/error.log|/var/log/nginx/access.log)'
USER root

ADD start.sh /var/www/html
RUN mkdir /init-scripts/ \
    && mv /var/www/html/start.sh /init-scripts/ \
    && chmod +x /init-scripts/start.sh

EXPOSE 80
ENTRYPOINT ["/init-scripts/start.sh"]