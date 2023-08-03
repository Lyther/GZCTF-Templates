FROM python

COPY app /app
WORKDIR /app

ADD start.sh .
RUN mkdir /init-scripts/ \
    && mv ./start.sh /init-scripts/ \
    && chmod +x /init-scripts/start.sh

EXPOSE 1337
ENTRYPOINT ["/init-scripts/start.sh"]