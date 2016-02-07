!/usr/bin/env bash
ulimit -n 30000
su - seafile -c "seafile.sh start"
su - seafile -c "seahub.sh start-fastcgi"
nginx
