FROM aacebedo/raspbian-jessie-minbase

ENV GO_VERSION 1.5.2

RUN apt-get install wget git mercurial -y --force-yes
ADD http://dave.cheney.net/paste/go${GO_VERSION}.linux-arm.tar.gz /tmp/go.tar.gz
RUN tar xvzf /tmp/go.tar.gz -C /usr/local
RUN export PATH=$PATH:/usr/local/go/bin/ \
&& export GOPATH=/go \
&& go get github.com/gliderlabs/registrator

ENTRYPOINT ["/go/bin/registrator"]

