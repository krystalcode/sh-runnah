#!/bin/bash

p run \
  --detach \
  --pod ${APP_CONTAINER_POD_NAME} \
  --name ${APP_CONTAINER_POD_NAME}_$service \
  --volume ${APP_CONTAINER_VOLUMES_DIR}/$service/config/Caddyfile:/etc/caddy/Caddyfile \
  --volume ${APP_CONTAINER_VOLUMES_DIR}/$service/data:/data \
  docker.io/caddy:${APP_CONTAINER_CADDY_VERSION}
