#!/bin/bash
groupmod -g $gid libreoffice
usermod -u $uid -g $gid libreoffice
exec su -ls "/bin/bash" -c "mkdir -p /home/libreoffice/.local/share; /usr/bin/libreoffice" libreoffice
