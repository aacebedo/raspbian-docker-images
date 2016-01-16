FROM clusterry/raspbian-jessie-minbase

ARG CONSUL_VERSION
ENV CONSUL_VERSION ${CONSUL_VERISON:-0.12.0}

RUN apt-get update
RUN apt-get install nginx wget unzip python3 python3-requests python3-pip -y --force-yes
RUN pip3 install quik
RUN wget https://releases.hashicorp.com/consul-template/${CONSUL_VERSION}/consul-template_${CONSUL_VERSION}_linux_arm.zip -O /tmp/consul-template.zip && unzip -d /usr/bin/ /tmp/consul-template.zip && rm /tmp/consul-template.zip

RUN rm -f /etc/nginx/sites-enabled/*

ADD files/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod u+x /usr/local/bin/entrypoint.sh

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["entrypoint.sh"]
