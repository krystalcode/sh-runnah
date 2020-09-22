#!/bin/bash

p run \
  --detach \
  --pod ${APP_CONTAINER_POD_NAME} \
  --name ${APP_CONTAINER_POD_NAME}_ngrok \
  --env NGROK_AUTH=${APP_CONTAINER_NGROK_AUTH} \
  docker.io/wernight/ngrok
