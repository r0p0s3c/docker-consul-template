FROM alpine

ENV CONSUL_TEMPLATE_VERSION 0.16.0

ADD https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip /

RUN \
	apk -U add bash

RUN \
	unzip consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip && \
	mv consul-template /bin/consul-template &&\
    	rm -rf /consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip && \
    	mkdir -p /consul-template /consul-template/config.d /consul-template/templates

RUN \
	rm -rf /var/cache/apk/*

ENTRYPOINT [ "/bin/consul-template"]
