FROM golang:alpine

ENV GO111MODULE=auto \
    CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64 \
    GOPATH=/

COPY files/ .
RUN go mod init main.go
RUN go mod tidy
RUN go build -o app .

ADD start.sh .
RUN mkdir /init-scripts/ \
    && mv ./start.sh /init-scripts/ \
    && chmod +x /init-scripts/start.sh

EXPOSE 9999
ENTRYPOINT ["/init-scripts/start.sh"]