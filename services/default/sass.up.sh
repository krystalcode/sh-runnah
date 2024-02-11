#!/bin/bash

p run \
  --detach \
  --pod ${APP_CONTAINER_POD_NAME} \
  --name ${APP_CONTAINER_POD_NAME}_sass \
  --volume ${PWD}:/src \
  --workdir /src/${APP_CONTAINER_SASS_WORKDIR} \
  docker.io/krystalcode/f_sass:n${APP_CONTAINER_SASS_NODE_VERSION} \
  sleep infinity
