#!/bin/bash

tmp_folder=tmp-a7vx888

cp -rf /etc/app-pod/conf.d/projects/default/${APP_CREATE_TEMPLATE}.create.files/* ${PWD}/

source /usr/local/bin/app-build

p run \
  --rm \
  --name ${APP_CONTAINER_POD_NAME}_composer \
  --env COMPOSER_MEMORY_LIMIT=-1 \
  --volume ${PWD}:/app \
  --volume $APP_IDE_HOME/.ssh:/root/.ssh \
  --volume ${PODMAN_VOLUMES_DIR}/global/php/.composer:/root/.composer \
  --workdir /app \
  ${APP_CONTAINER_REGISTRY}/${APP_CONTAINER_POD_NAME}_apache \
  /bin/bash -c "composer create-project drupal/recommended-project $tmp_folder"

if [ -d "${PWD}/scripts/permissions" ]; then
    mkdir ${PWD}/$tmp_folder/scripts
    mv ${PWD}/scripts/permissions ${PWD}/$tmp_folder/scripts
fi

shopt -s dotglob
mv ${PWD}/$tmp_folder/* ${PWD}/
rm -rf ${PWD}/$tmp_folder

p run \
  --rm \
  --name ${APP_CONTAINER_POD_NAME}_composer \
  --env COMPOSER_MEMORY_LIMIT=-1 \
  --volume ${PWD}:/app \
  --volume $APP_IDE_HOME/.ssh:/root/.ssh \
  --volume ${PODMAN_VOLUMES_DIR}/global/php/.composer:/root/.composer \
  --workdir /app \
  ${APP_CONTAINER_REGISTRY}/${APP_CONTAINER_POD_NAME}_apache \
  /bin/bash -c "composer remove drupal/core-project-message"
