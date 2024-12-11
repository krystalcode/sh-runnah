#!/bin/bash

service=$1
buildahfile=$2
run_command=$3

read -r -d '' run_command_addition << COMMAND
  --volume ${PWD}:/workdir
  --workdir /workdir
  ${APP_CONTAINER_REGISTRY}/${APP_CONTAINER_POD_NAME}_fedora
  sleep infinity
COMMAND
run_command="${run_command} ${run_command_addition}"

eval ${run_command}
