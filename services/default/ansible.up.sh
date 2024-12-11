#!/bin/bash

service=$1
buildahfile=$2
run_command=$3

if [ -z ${buildahfile} ]; then
    image=docker.io/krystalcode/f_ansible:latest
else
    image=${APP_CONTAINER_REGISTRY}/${APP_CONTAINER_POD_NAME}_${service}
fi

read -r -d '' run_command_addition << COMMAND
  --volume ${PWD}:/src
  --workdir /src
  $image
  sleep infinity
COMMAND
run_command="${run_command} ${run_command_addition}"

eval ${run_command}
