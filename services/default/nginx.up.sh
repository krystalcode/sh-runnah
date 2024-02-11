#!/bin/bash

service="nginx"

p run \
  --detach \
  --pod ${APP_CONTAINER_POD_NAME} \
  --name ${APP_CONTAINER_POD_NAME}_$service \
  --volume ${PWD}/${APP_CONTAINER_NGINX_HTML_DIR}:/usr/share/nginx/html \
  docker.io/library/nginx
