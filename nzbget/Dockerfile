FROM clusterry/raspbian-jessie-minbase
ENV COUCHPOTATO_VERSION 3.0.1
ENV COUCHPOTATO_USER couchpotato
ENV COUCHPOTATO_GROUP couchpotato
ENV COUCHPOTATO_UID 1000
ENV COUCHPOTATO_GID 1000

RUN apt-get install python git-core python-openssl python-lxml -y --force-yes
ADD https://github.com/RuudBurger/CouchPotatoServer/archive/build/${COUCHPOTATO_VERSION}.tar.gz /tmp/couchpotato.tar.gz
RUN mkdir /opt/couchpotato && tar xvzf /tmp/couchpotato.tar.gz -C /opt/couchpotato --strip 1 && chmod u+x /opt/couchpotato/CouchPotato.py && rm /tmp/couchpotato.tar.gz 
RUN groupadd -g ${COUCHPOTATO_GID} ${COUCHPOTATO_GROUP} \
&& useradd -g ${COUCHPOTATO_GROUP} -u ${COUCHPOTATO_UID} ${COUCHPOTATO_USER} \
&& chown -R couchpotato:couchpotato /opt/couchpotato

VOLUME ["/mnt/couchpotato"]

ENTRYPOINT ["/opt/couchpotato/CouchPotato.py"]
