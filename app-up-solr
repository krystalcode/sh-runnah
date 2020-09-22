#!/bin/bash

p run \
  --detach \
  --pod ${APP_CONTAINER_POD_NAME} \
  --name ${APP_CONTAINER_POD_NAME}_solr \
  --volume ${APP_CONTAINER_VOLUMES_DIR}/solr:/var/solr \
  --volume ${PWD}/podman/solr-conf:/opt/solr/server/solr/configsets/app:ro \
  docker.io/solr:${APP_CONTAINER_SOLR_VERSION} solr-precreate app /opt/solr/server/solr/configsets/app
