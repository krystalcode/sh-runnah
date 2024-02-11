#!/bin/bash

p run \
  --detach \
  --pod ${APP_CONTAINER_POD_NAME} \
  --name ${APP_CONTAINER_POD_NAME}_varnish \
  --env VARNISH_HTTP_PORT=7777 \
  --tmpfs /var/lib/varnish/varnishd:exec \
  --volume ${APP_CONTAINER_VOLUMES_DIR}/varnish/config/default.vcl:/etc/varnish/default.vcl:ro \
  docker.io/varnish:${APP_CONTAINER_VARNISH_VERSION} -p http_resp_hdr_len=24k
