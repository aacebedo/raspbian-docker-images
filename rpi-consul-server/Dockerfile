FROM aacebedo/rpi-consul

EXPOSE 8400
EXPOSE 8500
EXPOSE 8600
VOLUME ["/mnt/consul_data"]
ENTRYPOINT ["consul","agent","-server","-bootstrap", "-data-dir","/mnt/consul_data","-client","0.0.0.0", "-ui-dir", "/usr/share/consul/ui"]]

