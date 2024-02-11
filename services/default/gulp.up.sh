#!/bin/bash

p run \
  --detach \
  --pod ${APP_CONTAINER_POD_NAME} \
  --name ${APP_CONTAINER_POD_NAME}_gulp \
  --volume ${PWD}:/src \
  --workdir /src/${APP_CONTAINER_GULP_WORKDIR} \
  docker.io/krystalcode/f_gulp:${APP_CONTAINER_GULP_NODE_VERSION} \
  sleep infinity
