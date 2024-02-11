#!/bin/bash

p run \
  --detach \
  --pod ${APP_CONTAINER_POD_NAME} \
  --name ${APP_CONTAINER_POD_NAME}_$service \
  --volume ${APP_CONTAINER_VOLUMES_DIR}/mysql:/var/lib/mysql \
  docker.io/krystalcode/f_mycli \
  sleep infinity
