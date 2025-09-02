#!/bin/bash

service=$1
buildahfile=$2
run_command=$3
image_name=$4
image_version=$5
image=$6

.runnah.octane-frankenphp.options () {
    local command_options=""
    local variables_options="APP_CONTAINER_${service^^}_OCTANE_FRANKENPHP_OPTIONS"
    if [ ! -z ${!variables_options+x} ]; then
        IFS=',' read -r -a options <<< "${!variables_options}"
        for option in ${options[*]}
        do
            command_options="${command_options} --${option}"
        done
    fi

    echo "${command_options}"
}

image_with_options="${image}"
if [[ ${image_version} == *"frankenphp"* ]]; then
    octane_options=$(.runnah.octane-frankenphp.options)
    image_with_options="${image} serve ${octane_options}"
fi

read -r -d '' run_command_addition << COMMAND
     ${image_with_options}
COMMAND
run_command="${run_command} ${run_command_addition}"

eval ${run_command}
