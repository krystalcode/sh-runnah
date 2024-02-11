#!/bin/bash

p run \
  --detach \
  --pod ${APP_CONTAINER_POD_NAME} \
  --name ${APP_CONTAINER_POD_NAME}_openapi_generator \
  --volume ${PWD}:/src \
  --workdir /src/${APP_CONTAINER_OPENAPI_GENERATOR_WORKDIR} \
  docker.io/krystalcode/f_openapi_generator \
  sleep infinity
