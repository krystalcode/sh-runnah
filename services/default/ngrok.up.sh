#!/bin/bash

service=$1
buildahfile=$2
run_command=$3
image_name=$4
image_version=$5
image=$6

deprecated_variable_name="APP_CONTAINER_NGROK_AUTH"
if [ ! -z ${!deprecated_variable_name+x} ]; then
    echo "Please update your environment file to use APP_CONTAINER_NGROK_ENV__NGROK_AUTHTOKEN instead of APP_CONTAINER_NGROK_AUTH"
    exit 1
fi

deprecated_variable_name="APP_CONTAINER_NGROK_ENV__NGROK_AUTH"
if [ ! -z ${!deprecated_variable_name+x} ]; then
    echo "Please update your environment file to use APP_CONTAINER_NGROK_ENV__NGROK_AUTHTOKEN instead of APP_CONTAINER_NGROK_ENV__NGROK_AUTH"
    exit 1
fi

# If we are given a configuration file, we expect endpoints to be defined in it
# and we start all of them.
config_file="APP_CONTAINER_NGROK_CONFIG_FILE"
if [ ! -z ${!config_file+x} ]; then
    read -r -d '' run_command_addition << COMMAND
      --volume ${APP_CONTAINER_NGROK_CONFIG_FILE}:/home/ngrok/.config/ngrok/ngrok.yml
      ${image}
      start --all --config /home/ngrok/.config/ngrok/ngrok.yml
COMMAND
# Otherwise, we run an endpoint on the given or default host/port.
else
    host_port="${APP_CONTAINER_NGROK_HOST}:${APP_CONTAINER_NGROK_PORT}"
    read -r -d '' run_command_addition << COMMAND
      ${image}
      http ${host_port}
COMMAND
fi

run_command="${run_command} ${run_command_addition}"
eval ${run_command}
