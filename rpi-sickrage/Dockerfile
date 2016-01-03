FROM aacebedo/raspbian-jessie-minbase
ENV SICKRAGE_VERSION 4.2.5
ENV SICKRAGE_USER sickrage
ENV SICKRAGE_GROUP sickrage
ENV SICKRAGE_UID 1000
ENV SICKRAGE_GID 1000

RUN apt-get install python git-core python-cheetah -y --force-yes

ADD https://github.com/SiCKRAGETV/SickRage/archive/${SICKRAGE_VERSION}.tar.gz /tmp/sickrage.tar.gz
RUN mkdir /opt/sickrage && tar xvzf /tmp/sickrage.tar.gz -C /opt/sickrage --strip 1 && chmod u+x /opt/sickrage/SickBeard.py && rm /tmp/sickrage.tar.gz
RUN groupadd -g ${SICKRAGE_GID} ${SICKRAGE_GROUP} \
&& useradd -g ${SICKRAGE_GROUP} -u ${SICKRAGE_UID} ${SICKRAGE_USER} \
&& chown -R sickrage:sickrage /opt/sickrage

VOLUME ["/mnt/sickrage"]

ENTRYPOINT ["/opt/sickrage/SickBeard.py"]
