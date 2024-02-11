#!/bin/bash

SERVICE=$1
BUILDAHFILE=$2

if [ -z ${BUILDAHFILE} ]; then
    image=docker.io/krystalcode/f_ansible:latest
else
    image=${APP_CONTAINER_REGISTRY}/${APP_CONTAINER_POD_NAME}_${SERVICE}
fi

p run \
  --detach \
  --pod ${APP_CONTAINER_POD_NAME} \
  --name ${APP_CONTAINER_POD_NAME}_${SERVICE} \
  --volume ${PWD}:/src \
  --workdir /src \
  $image \
  sleep infinity
