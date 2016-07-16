FROM ubuntu:xenial

ENV RABBITMQ_HOST sensu-rabbitmq
ENV RABBITMQ_VHOST /sensu
ENV RABBITMQ_USER sensu
ENV RABBITMQ_PASSWORD secret
ENV RADIS_HOST sensu-redis
ENV API_HOST sensu-api
ENV API_USER sensu
ENV API_PASSWORD secret

ADD http://sensu.global.ssl.fastly.net/apt/pubkey.gpg /sensu_key.gpg

RUN \
  apt-key add sensu_key.gpg && \
	echo "deb     http://sensu.global.ssl.fastly.net/apt sensu main" | tee /etc/apt/sources.list.d/sensu.list && \
  apt-get update && \
  apt-get install -y sensu

COPY config/config.json /etc/sensu/

COPY docker-entrypoint.sh /entrypoint.sh

ENV TERM vt100

ENTRYPOINT ["/entrypoint.sh"]
