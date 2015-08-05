#!/bin/bash
groupmod -g $gid libreoffice
usermod -u $uid -g $gid libreoffice
exec su -ls "/bin/bash" -c "mkdir -p /home/libreoffice/.local/share; /usr/local/bin/libreoffice5.0" libreoffice
