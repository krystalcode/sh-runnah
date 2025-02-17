#!/bin/bash

service=$1
buildahfile=$2
run_command=$3
image_name=$4
image_version=$5

if [ -z ${buildahfile} ]; then
    image="${image_name}:${image_version}"
else
    image="${APP_CONTAINER_REGISTRY}/${APP_CONTAINER_POD_NAME}_${service}"
fi

read -r -d '' run_command_addition << COMMAND
  --volume ${APP_CONTAINER_VOLUMES_DIR}:/var/syncthing \
  docker.io/syncthing/syncthing
COMMAND
run_command="${run_command} ${run_command_addition}"

eval ${run_command}
