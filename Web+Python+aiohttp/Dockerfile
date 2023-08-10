FROM ubuntu:bionic
RUN apt-get -q -y update && \
    apt-get -q -y install \
    python3-dev \
    python3-pip

COPY requirements.txt .
RUN pip3 install multidict typing_extensions attrs yarl async_timeout idna_ssl charset_normalizer aiosignal
RUN pip3 install -r requirements.txt

COPY files/ .

ADD start.sh .
RUN mkdir /init-scripts/ \
    && mv ./start.sh /init-scripts/ \
    && chmod +x /init-scripts/start.sh

EXPOSE 9999
ENTRYPOINT ["/init-scripts/start.sh"]