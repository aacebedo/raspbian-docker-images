#!/usr/bin/env bash
service nginx start
for var in "$@"
do
    arr=(${var//=/ })  
    if [ ${arr[0]} = "-consul" ]
    then
      export CONSUL_HTTP_ADDR=${arr[1]}
      echo $CONSUL_HTTP_ADDR
    fi
done
consul-template $@
