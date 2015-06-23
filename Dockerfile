FROM ubuntu:14.04

MAINTAINER Chris Daish <chrisdaish@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV LIBREOFFICEVERSION 1:4.2.8-0ubuntu2
ENV uid 1000
ENV gid 1000

RUN useradd -m libreoffice; \
    apt-get update; \
    apt-get install -y libreoffice=$LIBREOFFICEVERSION; \
    rm -rf /var/lib/apt/lists/*

COPY start-libreoffice.sh /tmp/

ENTRYPOINT ["/tmp/start-libreoffice.sh"]
