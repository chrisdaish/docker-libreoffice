#!/bin/bash
groupmod -g $gid libreoffice
usermod -u $uid -g $gid libreoffice

if [ -d /home/libreoffice/.config/libreoffice ]; then
  chown -R libreoffice:libreoffice /home/libreoffice/.config/libreoffice
fi

exec su -ls "/bin/bash" -c "mkdir -p /home/libreoffice/.local/share; libreoffice5.3 " libreoffice
