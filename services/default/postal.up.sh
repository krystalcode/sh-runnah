#!/bin/bash

p run \
  --detach \
  --pod ${APP_CONTAINER_POD_NAME} \
  --name ${APP_CONTAINER_POD_NAME}_postal \
  --volume ${APP_CONTAINER_VOLUMES_DIR}/postal:/config \
  ghcr.io/postalserver/postal:${APP_CONTAINER_POSTAL_VERSION} postal web-server
