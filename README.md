LibreOffice
===========

Unofficial build of LibreOffice 5.0.0.5 running within a docker container and rendered by the local X Server.

Changelog
---------
```
v1.1
* Updated image to LibreOffice 5.

v1.0
* User permissions now correlate between host and container. This allows LibreOffice documents to be saved back to the host system by passing in the local users uid/gid as environment variables.
```

Launch Command
---------------
```
docker run -v $HOME/Documents:/home/libreoffice/Documents:rw -v /tmp/.X11-unix:/tmp/.X11-unix -e uid=$(id -u) -e gid=$(id -g) -e DISPLAY=unix$DISPLAY --name libreoffice chrisdaish/libreoffice
```

FAQ
---
Note: If you receive the following Gtk error:

```
Gtk-WARNING **: cannot open display: unix:0.0
```
Simply allow the docker user to communicate with your X session

```
xhost +local:docker
```
