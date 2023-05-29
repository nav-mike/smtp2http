FROM golang:1.14.4-alpine

WORKDIR /go/src/build
COPY . .
ENV CGO_ENABLED=0
RUN GOOS=linux GOARCH=arm64 go build -mod vendor -a -o smtp2http .
RUN chmod +x smtp2http

CMD ["/go/src/build/smtp2http", "--timeout.read=50", "--timeout.write=50", "--webhook=https://webhook.site/140c4bd7-640a-438d-9c0f-751f7d4da372"]