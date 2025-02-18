#!/bin/bash

service=$1
buildahfile=$2
run_command=$3
image_name=$4
image_version=$5
image=$6

backups_volume=""
if [ ! -v ${APP_CONTAINER_APACHE_BACKUPS_DIR+x} ]; then
    backups_volume="--volume ${APP_CONTAINER_APACHE_BACKUPS_DIR}:${APP_SCRIPTS_LOCAL_DIR}/rebuild/backups"
fi

read -r -d '' run_command_addition << COMMAND
  --entrypoint /bin/bash
  --tmpfs /app/cache:rw,noexec
  --volume ${PWD}:/var/www/html
  --volume ${PODMAN_VOLUMES_DIR}/global/php/.composer:/root/.composer
  --volume ${PODMAN_VOLUMES_DIR}/global/php/.drush:/root/.drush
  ${backups_volume}
  ${image}
  -c 'set -e && cd /var/www/html/scripts/permissions && ./cache.sh && exec apache2-foreground'
COMMAND
run_command="${run_command} ${run_command_addition}"

eval ${run_command}
