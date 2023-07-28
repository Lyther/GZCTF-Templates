FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y apt-utils apt-transport-https && \
    apt-get install -y lib32z1 xinetd && \
    apt-get -y dist-upgrade

RUN useradd -m ctf

WORKDIR /home/ctf

RUN cp -R /lib* /home/ctf && \
    cp -R /usr/lib* /home/ctf

RUN mkdir /home/ctf/dev && \
    mknod /home/ctf/dev/null c 1 3 && \
    mknod /home/ctf/dev/zero c 1 5 && \
    mknod /home/ctf/dev/random c 1 8 && \
    mknod /home/ctf/dev/urandom c 1 9 && \
    chmod 666 /home/ctf/dev/*

RUN mkdir /home/ctf/bin && \
    cp /bin/sh /home/ctf/bin && \
    cp /bin/ls /home/ctf/bin && \
    cp /bin/cat /home/ctf/bin

COPY ./ctf.xinetd /etc/xinetd.d/ctf
RUN echo "Blocked by ctf_xinetd" > /etc/banner_fail

COPY ./files/ /home/ctf/

ADD start.sh /home/ctf
RUN mkdir /init-scripts/ \
    && mv /home/ctf/start.sh /init-scripts/ \
    && chmod +x /init-scripts/start.sh

EXPOSE 9999
ENTRYPOINT ["/init-scripts/start.sh"]