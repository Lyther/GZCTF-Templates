FROM ubuntu:bionic
RUN apt-get -q -y update && \
    apt-get -q -y install \
    python3-dev \
    xinetd \
    python3-pip

COPY requirements.txt .
RUN pip3 install -r requirements.txt

COPY ./ctf.xinetd /etc/xinetd.d/ctf
RUN echo "Blocked by ctf_xinetd" > /etc/banner_fail

COPY files/ .

ADD start.sh .
RUN mkdir /init-scripts/ \
    && mv ./start.sh /init-scripts/ \
    && chmod +x /init-scripts/start.sh

EXPOSE 1337
ENTRYPOINT ["/init-scripts/start.sh"]