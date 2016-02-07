FROM aacebedo/raspbian-jessie-minbase
FROM ubuntu:15.10
RUN apt-get update
RUN apt-get install nginx python3-pip python3 python3-pexpect python2.7 libpython2.7 python-setuptools python-imaging python-ldap sqlite3 -y --force-yes
RUN pip3 install quik
ADD files/entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod u+x /usr/bin/entrypoint.sh
ADD files/seafile-installer.py /usr/local/bin/seafile-installer.py
RUN rm -rf /etc/nginx/sites-enabled/*

ARG SEAFILE_VERSION
ENV SEAFILE_VERSION ${SEAFILE_VERSION:-5.0.4}

ARG SEAFILE_UID
ENV SEAFILE_UID ${SEAFILE_UID:-1000}

ARG SEAFILE_GID
ENV SEAFILE_GID ${SEAFILE_GID:-1000}

ARG SEAFILE_SERVERNAME
ENV SEAFILE_SERVERNAME ${SEAFILE_SERVERNAME:-seafile}

ARG SEAFILE_SERVERHOST
ENV SEAFILE_SERVERHOST ${SEAFILE_SERVERHOST:-seafile.local}

ARG SEAFILE_DATADIR
ENV SEAFILE_DATADIR ${SEAFILE_DATADIR:-/mnt/data}

ARG SEAFILE_INSTALLDIR
ENV SEAFILE_INSTALLDIR ${SEAFILE_INSTALLDIR:-/opt/seafile}

ARG SEAFILE_ADMINEMAIL
ENV SEAFILE_ADMINEMAIL ${SEAFILE_ADMINEMAIL:-admin@${SEAFILE_SERVERHOST}}

ARG SEAFILE_ADMINPASSWORD
ENV SEAFILE_ADMINPASSWORD ${SEAFILE_ADMINPASSWORD:-password}

RUN groupadd -g ${SEAFILE_GID} seafile \
&& useradd -g seafile -u ${SEAFILE_UID} seafile

ADD https://github.com/haiwen/seafile-rpi/releases/download/v${SEAFILE_VERSION}/seafile-server_stable_${SEAFILE_VERSION}_pi.tar.gz /tmp/seafile.tar.gz
#ADD https://bintray.com/artifact/download/seafile-org/seafile/seafile-server_5.0.4_x86-64.tar.gz /tmp/seafile.tar.gz
RUN seafile-installer.py --install-dir ${SEAFILE_INSTALLDIR} --data-dir ${SEAFILE_DATADIR} --server-host ${SEAFILE_SERVERHOST} --server-name ${SEAFILE_SERVERNAME} --admin-email ${SEAFILE_ADMINEMAIL} --admin-password ${SEAFILE_ADMINPASSWORD} --nginx-dir / /tmp/seafile.tar.gz
RUN chown -R seafile:seafile ${SEAFILE_INSTALLDIR}
RUN chown -R seafile:seafile ${SEAFILE_DATADIR}
RUN rm /tmp/seafile.tar.gz 

EXPOSE 80
EXPOSE 443
ENTRYPOINT ["entrypoint.sh"]
