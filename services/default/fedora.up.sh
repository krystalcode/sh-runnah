#!/bin/bash

p run \
  --detach \
  --pod ${APP_CONTAINER_POD_NAME} \
  --name ${APP_CONTAINER_POD_NAME}_fedora \
  --volume ${PWD}:/workdir \
  --workdir /workdir \
  ${APP_CONTAINER_REGISTRY}/${APP_CONTAINER_POD_NAME}_fedora \
  sleep infinity
