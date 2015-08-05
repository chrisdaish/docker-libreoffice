FROM ubuntu:14.04

MAINTAINER Chris Daish <chrisdaish@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV LIBREOFFICEPACKAGE LibreOffice_5.0.0_Linux_x86-64_deb.tar.gz
ENV LIBREOFFICEDIR LibreOffice_5.0.0.5_Linux_x86-64_deb

RUN useradd -m libreoffice; \
    apt-get update \
    && apt-get install -y --no-install-recommends wget \
                                                  libdbus-glib-1-2 \
                                                  libsm6 \
                                                  openjdk-7-jre \
    && rm -rf /var/lib/apt/lists/*

RUN wget -q http://mirror.switch.ch/ftp/mirror/tdf/libreoffice/stable/5.0.0/deb/x86_64/$LIBREOFFICEPACKAGE -O /tmp/$LIBREOFFICEPACKAGE \
    && mkdir /tmp/LibreOffice \
    && tar -xzf /tmp/$LIBREOFFICEPACKAGE -C /tmp/LibreOffice \
    && dpkg -i /tmp/LibreOffice/$LIBREOFFICEDIR/DEBS/*.deb \
    && rm -f /tmp/$LIBREOFFICEPACKAGE \
    && rm -rf /tmp/LibreOffice

COPY start-libreoffice.sh /tmp/

ENTRYPOINT ["/tmp/start-libreoffice.sh"]
