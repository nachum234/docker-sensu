#!/bin/bash
set -e

CONFIG_FILE=/etc/sensu/config.json

sed -i "s|#RABBITMQ_HOST#|${RABBITMQ_HOST}|g" ${CONFIG_FILE}
sed -i "s|#RABBITMQ_VHOST#|${RABBITMQ_VHOST}|g" ${CONFIG_FILE}
sed -i "s|#RABBITMQ_USER#|${RABBITMQ_USER}|g" ${CONFIG_FILE}
sed -i "s|#RABBITMQ_PASSWORD#|${RABBITMQ_PASSWORD}|g" ${CONFIG_FILE}
sed -i "s|#RADIS_HOST#|${RADIS_HOST}|g" ${CONFIG_FILE}
sed -i "s|#API_HOST#|${API_HOST}|g" ${CONFIG_FILE}
sed -i "s|#API_USER#|${API_USER}|g" ${CONFIG_FILE}
sed -i "s|#API_PASSWORD#|${API_PASSWORD}|g" ${CONFIG_FILE}

exec "$@"
