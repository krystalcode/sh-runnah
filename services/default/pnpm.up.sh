#!/bin/bash

p run \
  --detach \
  --pod ${APP_CONTAINER_POD_NAME} \
  --name ${APP_CONTAINER_POD_NAME}_$service \
  --volume ${PWD}:/src \
  --workdir /src \
  docker.io/krystalcode/f_pnpm sleep infinity
