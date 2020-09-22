#!/bin/bash

p run \
  --detach \
  --pod ${APP_CONTAINER_POD_NAME} \
  --name ${APP_CONTAINER_POD_NAME}_mysql \
  --env MYSQL_ALLOW_EMPTY_PASSWORD=yes \
  --env MYSQL_USER=application \
  --env MYSQL_PASSWORD=application \
  --env MYSQL_DATABASE=application \
  --volume ${APP_CONTAINER_VOLUMES_DIR}/mysql:/var/lib/mysql \
  docker.io/percona:${APP_CONTAINER_MYSQL_VERSION} \
  --max_allowed_packet=48M \
  --character-set-server=utf8mb4 \
  --collation-server=utf8mb4_unicode_ci
