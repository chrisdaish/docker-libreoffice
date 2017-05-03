FROM ubuntu:14.04.3

MAINTAINER Chris Daish <chrisdaish@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN useradd -m libreoffice; \
    apt-get update \
    && apt-get install -y --no-install-recommends wget \
                                                  libdbus-glib-1-2 \
                                                  libsm6 \
                                                  openjdk-7-jre \
    && rm -rf /var/lib/apt/lists/*

RUN wget -q http://download.documentfoundation.org/libreoffice/stable/5.3.2/deb/x86_64/LibreOffice_5.3.2_Linux_x86-64_deb.tar.gz -O /tmp/pack.tar.gz \
     && mkdir /tmp/LibreOffice \
     && tar -xzf /tmp/pack.tar.gz -C /tmp/LibreOffice \
     && dpkg -i /tmp/LibreOffice/LibreOffice_5.3.2.2_Linux_x86-64_deb/DEBS/*.deb \
     && rm -f /tmp/pack.tar.gz \
     && rm -rf /tmp/LibreOffice

COPY start-libreoffice.sh /tmp/

ENTRYPOINT ["/tmp/start-libreoffice.sh"]
