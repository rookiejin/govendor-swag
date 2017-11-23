FROM golang:1.9.2-alpine3.6
RUN apk update && apk add --no-cache git supervisor
WORKDIR /go/src/app
# go get -u -v github.com/kardianos/govendor

RUN go get -u -v github.com/kardianos/govendor && \
    go install github.com/kardianos/govendor   && \
    go get -u github.com/swaggo/swag/cmd/swag  && \
    go install github.com/swaggo/swag/cmd/swag 
