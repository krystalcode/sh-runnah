#!/bin/bash

p run \
  --detach \
  --pod ${APP_CONTAINER_POD_NAME} \
  --name ${APP_CONTAINER_POD_NAME}_apache \
  --entrypoint /bin/bash \
  --tmpfs /app/cache:rw,noexec \
  --volume ${PWD}:/var/www/html \
  --volume ${PODMAN_VOLUMES_DIR}/global/php/.composer:/root/.composer \
  --volume ${PODMAN_VOLUMES_DIR}/global/php/.drush:/root/.drush \
  ${APP_CONTAINER_REGISTRY}/${APP_CONTAINER_POD_NAME}_apache \
  -c 'set -e && cd /var/www/html/scripts/permissions && ./cache.sh && exec apache2-foreground'
