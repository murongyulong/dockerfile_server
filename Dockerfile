FROM golang:1.4
RUN mkdir -p $GOPATH/src/github.com/dinp \
&& cd $GOPATH/src/github.com/dinp \
&& git clone https://github.com/dinp/builder.git \
&& cd builder \
&& go get ./... \
&& go build
WORKDIR $GOPATH/src/github.com/dinp/builder/
COPY app.conf $GOPATH/src/github.com/dinp/builder/conf/app.conf
COPY run.sh /run.sh
RUN chmod +x /run.sh
CMD ["/run.sh"]
