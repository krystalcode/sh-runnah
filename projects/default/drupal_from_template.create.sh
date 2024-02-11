#!/bin/bash

tmp_folder=tmp-a7vx888

p run \
  --rm \
  --name ${APP_CONTAINER_POD_NAME}_composer \
  --volume ${PWD}:/app \
  --volume $APP_IDE_HOME/.ssh:/root/.ssh \
  --volume ${PODMAN_VOLUMES_DIR}/global/php/.composer:/root/.composer \
  --workdir /app \
  ${APP_CONTAINER_REGISTRY}/${APP_CONTAINER_POD_NAME}_apache \
  /bin/bash -c "composer create-project drupal/recommended-project $tmp_folder"

shopt -s dotglob
mv ${PWD}/$tmp_folder/* ${PWD}/
rm -rf ${PWD}/$tmp_folder

p run \
  --rm \
  --name ${APP_CONTAINER_POD_NAME}_composer \
  --volume ${PWD}:/app \
  --volume $APP_IDE_HOME/.ssh:/root/.ssh \
  --volume ${PODMAN_VOLUMES_DIR}/global/php/.composer:/root/.composer \
  --workdir /app \
  ${APP_CONTAINER_REGISTRY}/${APP_CONTAINER_POD_NAME}_apache \
  /bin/bash -c "composer remove drupal/core-project-message"
