#!/bin/bash

service=$1
buildahfile=$2
run_command=$3

read -r -d '' run_command_addition << COMMAND
  --volume ${PWD}:/src
  --workdir /src/${APP_CONTAINER_GULP_WORKDIR}
  docker.io/krystalcode/f_gulp:${APP_CONTAINER_GULP_NODE_VERSION}
  sleep infinity
COMMAND
run_command="${run_command} ${run_command_addition}"

eval ${run_command}
