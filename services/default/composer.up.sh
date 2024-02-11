#!/bin/bash

service=composer

p run \
  --detach \
  --pod ${APP_CONTAINER_POD_NAME} \
  --name ${APP_CONTAINER_POD_NAME}_$service \
  --volume ${PODMAN_VOLUMES_DIR}/global/php/.composer:/root/.composer \
  ${APP_CONTAINER_REGISTRY}/${APP_CONTAINER_POD_NAME}_$service
