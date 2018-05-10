FROM ubuntu:14.04
ENV DEBIAN_FRONTEND noninteractive

# setup golang
RUN mkdir -p /app/src/cron/
RUN mkdir -p /app/bin/
ENV GOPATH /app/
RUN apt-get update --yes --force-yes
RUN apt-get install --yes --force-yes build-essential curl software-properties-common apt-transport-https ca-certificates

# Install golang
RUN curl -O https://storage.googleapis.com/golang/go1.9.3.linux-amd64.tar.gz
RUN tar -xvf go1.9.3.linux-amd64.tar.gz
RUN sudo chown -R root:root ./go
RUN sudo mv go /usr/local

ADD . /app/src/cron/
RUN /usr/local/go version
RUN /usr/local/go install cron

CMD ["/app/bin/cron"]
