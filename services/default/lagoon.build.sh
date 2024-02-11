#!/bin/bash

SERVICE=$1
BUILDAHFILE=$2

if [ -z ${BUILDAHFILE} ]; then
    image=docker.io/krystalcode/f_lagoon_cli:${APP_CONTAINER_LAGOON_VERSION}
else
    image=${APP_CONTAINER_REGISTRY}/${APP_CONTAINER_POD_NAME}_${SERVICE}
fi

b bud \
  --layers \
  --squash \
  --build-arg BUILD_LAGOON_VERSION=${APP_CONTAINER_LAGOON_VERSION} \
  --build-arg BUILD_LAGOON_PROJECT=${APP_CONTAINER_LAGOON_PROJECT} \
  -f ${BUILDAHFILE} \
  -t $image .
