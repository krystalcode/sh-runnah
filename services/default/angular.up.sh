#!/bin/bash

service="angular"

p run \
  --detach \
  --pod ${APP_CONTAINER_POD_NAME} \
  --name ${APP_CONTAINER_POD_NAME}_$service \
  --volume ${PWD}:/src \
  --workdir /src \
  docker.io/krystalcode/f_angular sleep infinity
