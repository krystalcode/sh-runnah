#!/bin/bash

p run \
  --detach \
  --pod ${APP_CONTAINER_POD_NAME} \
  --name ${APP_CONTAINER_POD_NAME}_elastic_beats_filebeat \
  --volume ${APP_CONTAINER_BEATS_FILEBEAT_CONTAINERS_DIR}:/var/lib/docker/containers:ro \
  /var/lib/docker/containers:/var/lib/docker/containers:ro
  ${APP_CONTAINER_REGISTRY}/${APP_CONTAINER_POD_NAME}_elastic_beats_filebeat
