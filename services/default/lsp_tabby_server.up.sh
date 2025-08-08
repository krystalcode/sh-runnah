#!/bin/bash

service=$1
buildahfile=$2
run_command=$3
image_name=$4
image_version=$5
image=$6

model_directory="${APP_CONTAINER_VOLUMES_DIR}/models"
if [ ! -d "${model_directory}" ]; then
    mkdir "${model_directory}"
fi

model_variable_name="APP_CONTAINER_${service^^}_MODEL"
if [ -z ${!model_variable_name+x} ]; then
    printf "[ERROR] Please provide the model\n"
    exit
else
    model=${!model_variable_name}
fi

if [ ! -d "${model_directory}/${APP_CONTAINER_LSP_TABBY_SERVER_MODEL}" ]; then
    read -r -d '' download_command << COMMAND
      p run
        -it
        --rm
        --volume ${model_directory}:/root/.tabby/models/TabbyML
        ${image}
        download ${APP_CONTAINER_LSP_TABBY_SERVER_MODEL}
COMMAND
    eval ${download_command}
fi

read -r -d '' run_command_addition << COMMAND
  --volume ${model_directory}:/root/.tabby/models/TabbyML
  ${image}
  run ${APP_CONTAINER_LSP_TABBY_SERVER_MODEL}
COMMAND
run_command="${run_command} ${run_command_addition}"

eval ${run_command}
