#!/bin/bash

SERVICE=$1
BUILDAHFILE=$2

if [ -z ${BUILDAHFILE} ]; then
    image=docker.io/krystalcode/f_lagoon_cli:${APP_CONTAINER_LAGOON_VERSION}
else
    image=${APP_CONTAINER_REGISTRY}/${APP_CONTAINER_POD_NAME}_${SERVICE}
fi
    
p run \
  --detach \
  --pod ${APP_CONTAINER_POD_NAME} \
  --name ${APP_CONTAINER_POD_NAME}_lagoon \
  --env LAGOON_PROJECT=${APP_CONTAINER_LAGOON_PROJECT} \
  --env LAGOON_SSH_HOSTNAME=${APP_CONTAINER_LAGOON_SSH_HOSTNAME} \
  --volume ${PWD}:/src \
  --volume ${APP_IDE_HOME}/.ssh/${APP_CONTAINER_LAGOON_SSH_KEY}:/root/.ssh/id_ed25519:ro \
  --workdir /src \
  $image \
  sleep infinity
