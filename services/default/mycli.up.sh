#!/bin/bash

service=$1
buildahfile=$2
run_command=$3

read -r -d '' run_command_addition << COMMAND
  --volume ${APP_CONTAINER_VOLUMES_DIR}/mysql:/var/lib/mysql
  docker.io/krystalcode/f_mycli
  sleep infinity
COMMAND
run_command="${run_command} ${run_command_addition}"

eval ${run_command}
