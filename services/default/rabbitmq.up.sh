#!/bin/bash

p run \
  --detach \
  --pod ${APP_CONTAINER_POD_NAME} \
  --name ${APP_CONTAINER_POD_NAME}_rabbitmq \
  --env RABBITMQ_DEFAULT_USER=application \
  --env RABBITMQ_DEFAULT_PASS=application \
  --env RABBITMQ_DEFAULT_VHOST=application \
  --volume ${APP_CONTAINER_VOLUMES_DIR}/rabbitmq:/var/lib/rabbitmq \
  docker.io/rabbitmq:${APP_CONTAINER_RABBITMQ_VERSION}-alpine
