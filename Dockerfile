FROM golang:1.9.2-alpine3.6
RUN echo http://mirrors.ustc.edu.cn/alpine/v3.6/main/ > /etc/apk/repositories
RUN apk update && apk add --no-cache git supervisor
WORKDIR /go/src/app
# go get -u -v github.com/kardianos/govendor

RUN go get -u -v github.com/kardianos/govendor && \
    go install github.com/kardianos/govendor   && \
    go get -u github.com/swaggo/swag/cmd/swag  && \
    go install github.com/swaggo/swag/cmd/swag && \
    swag -v && \
    govendor -v  
