#!/bin/bash

service=$1
buildahfile=$2
run_command=$3
image_name=$4
image_version=$5
image=$6

config_dir="${APP_CONTAINER_VOLUMES_DIR}/config"
if [ ! -d ${config_dir} ]; then
    mkdir -p ${config_dir}
fi

read -r -d '' run_command_addition << COMMAND
  --volume ${APP_CONTAINER_VOLUMES_DIR}/config:/config
  ${image}
COMMAND
run_command="${run_command} ${run_command_addition}"

eval ${run_command}
