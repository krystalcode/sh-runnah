#!/bin/bash

version_major=${APP_CONTAINER_SOLR_VERSION:0:1}

volume_path=/var/solr/data
# Compatibility with previous versions of the docker image.
if [ $version_major = "7" ]
then
   volume_path=/opt/solr/server/solr/mycores
fi

p run \
  --detach \
  --pod ${APP_CONTAINER_POD_NAME} \
  --name ${APP_CONTAINER_POD_NAME}_solr \
  --env JAVA_OPTS="-Xms1024m -Xmx2048m" \
  --volume ${APP_CONTAINER_VOLUMES_DIR}/solr:$volume_path \
  docker.io/solr:${APP_CONTAINER_SOLR_VERSION} solr-precreate ${APP_CONTAINER_SOLR_CORE}
