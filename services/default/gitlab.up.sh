#!/bin/bash

p run \
  --detach \
  --pod ${APP_CONTAINER_POD_NAME} \
  --name ${APP_CONTAINER_POD_NAME}_gitlab \
  --env GITLAB_OMNIBUS_CONFIG="external_url '${APP_CONTAINER_GITLAB_EXTERNAL_URL}'" \
  --env GITLAB_PORT="${APP_CONTAINER_GITLAB_PORT}" \
  --volume ${APP_CONTAINER_VOLUMES_DIR}/config:/etc/gitlab \
  --volume ${APP_CONTAINER_VOLUMES_DIR}/logs:/var/log/gitlab \
  --volume ${APP_CONTAINER_VOLUMES_DIR}/data:/var/opt/gitlab \
  docker.io/gitlab/gitlab-ce:${APP_CONTAINER_GITLAB_VERSION}-ce.0
