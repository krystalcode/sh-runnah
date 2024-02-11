#!/bin/bash

p run \
  --detach \
  --pod ${APP_CONTAINER_POD_NAME} \
  --name ${APP_CONTAINER_POD_NAME}_elastic_apm_server \
  ${APP_CONTAINER_REGISTRY}/${APP_CONTAINER_POD_NAME}_elastic_apm_server
