FROM golang:1.9.2-alpine3.6
# add git support 
RUN apk update && apk add git

# add dep support 
RUN go get -u github.com/golang/dep/cmd/dep
# add go-swagger support 
RUN go get -u github.com/go-swagger/go-swagger/cmd/swagger
# clean the directory 
RUN rm -rf /go/src/* && mkdir -p /go/src/app
# add /go/bin tothe $PATH
RUN echo export PATH=$PATH:/go/bin >> /etc/profile && source /etc/profile
WORKDIR /go/src/app

# add port 
EXPOSE 80
EXPOSE 443 

