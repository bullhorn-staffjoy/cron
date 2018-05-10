FROM ubuntu:14.04
ENV DEBIAN_FRONTEND noninteractive

# setup golang
RUN mkdir -p /app/src/cron/
RUN mkdir -p /app/bin/
ENV GOPATH /app/
RUN apt-get update --yes --force-yes
RUN apt-get install --yes --force-yes build-essential curl software-properties-common apt-transport-https ca-certificates golang-go

ADD . /app/src/cron/
RUN go version
RUN go install cron

CMD ["/app/bin/cron"]
