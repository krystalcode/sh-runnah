#!/bin/bash

service=$1
buildahfile=$2
run_command=$3

read -r -d '' run_command_addition << COMMAND
  --env GITLAB_OMNIBUS_CONFIG="external_url '${APP_CONTAINER_GITLAB_EXTERNAL_URL}'" \
  --env GITLAB_PORT="${APP_CONTAINER_GITLAB_PORT}" \
  --volume ${APP_CONTAINER_VOLUMES_DIR}/config:/etc/gitlab \
  --volume ${APP_CONTAINER_VOLUMES_DIR}/logs:/var/log/gitlab \
  --volume ${APP_CONTAINER_VOLUMES_DIR}/data:/var/opt/gitlab \
  docker.io/gitlab/gitlab-ce:${APP_CONTAINER_GITLAB_VERSION}-ce.0
COMMAND
run_command="${run_command} ${run_command_addition}"

eval ${run_command}
