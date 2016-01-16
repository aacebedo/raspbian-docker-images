FROM clusterry/raspbian-jessie-minbase

ARG CONSUL_VERSION
ENV CONSUL_VERSION ${CONSUL_VERSION:-0.6.0}

RUN apt-get install wget unzip apt-utils -y --force-yes
RUN wget https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_arm.zip -O /tmp/consul.zip && unzip -d /usr/bin/ /tmp/consul.zip && rm /tmp/consul.zip
RUN wget https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_web_ui.zip -O /tmp/consului.zip && mkdir -p /usr/share/consul/ui && unzip -d /usr/share/consul/ui /tmp/consului.zip && rm /tmp/consului.zip

EXPOSE 8400
EXPOSE 8500
EXPOSE 53

ENTRYPOINT ["consul"]
CMD ["agent","-server","-bootstrap", "-data-dir","/mnt/consul/data","-client","0.0.0.0", "-ui-dir", "/usr/share/consul/ui"]
