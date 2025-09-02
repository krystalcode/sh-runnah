#!/bin/bash

# @ THis is exactly the same as stack.up.sh . Reusable generic templates?

service=$1
buildahfile=$2
run_command=$3
image_name=$4
image_version=$5
image=$6

read -r -d '' run_command_addition << COMMAND
  ${image}
  sleep infinity
COMMAND
run_command="${run_command} ${run_command_addition}"

eval ${run_command}
