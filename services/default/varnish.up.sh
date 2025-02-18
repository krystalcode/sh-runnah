#!/bin/bash

service=$1
buildahfile=$2
run_command=$3
image_name=$4
image_version=$5
image=$6

read -r -d '' run_command_addition << COMMAND
  --env VARNISH_HTTP_PORT=7777
  --tmpfs /var/lib/varnish/varnishd:exec
  --volume ${APP_CONTAINER_VOLUMES_DIR}/varnish/config/default.vcl:/etc/varnish/default.vcl:ro
  ${image} -p http_resp_hdr_len=24k
COMMAND
run_command="${run_command} ${run_command_addition}"

eval ${run_command}
