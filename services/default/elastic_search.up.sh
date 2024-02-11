#!/bin/bash

p run \
  --detach \
  --pod ${APP_CONTAINER_POD_NAME} \
  --name ${APP_CONTAINER_POD_NAME}_elastic_search \
  --env ES_JAVA_OPTS="-Xms512m -Xmx512m" \
  --volume ${APP_CONTAINER_VOLUMES_DIR}/elastic_search:/usr/share/elasticsearch/data \
  --ulimit memlock=-1:-1 \
  --ulimit nofile=65535:65535 \
  ${APP_CONTAINER_REGISTRY}/${APP_CONTAINER_POD_NAME}_elastic_search
