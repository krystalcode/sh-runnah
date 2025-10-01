#!/bin/bash
#
# Copies scripts so that they are executable from anywhere in the system.
#
# @I Find a way for building, packaging and distributing scripts
#    type     : feature
#    priority : low
#    labels   : installation
#    notes    : Not a priority because the project will most likely be rewritten
#               to another language.

\cp app \
    app-build \
    app-clean \
    app-create \
    app-down \
    app-enter \
    app-env-build \
    app-exec \
    app-functions \
    app-init \
    app-logs \
    app-restart \
    app-stop \
    app-up \
    /usr/local/bin/

config_dir=/etc/app-pod/conf.d
services_dir_subpath=services/default
services_dir=$config_dir/$services_dir_subpath
projects_dir_subpath=projects/default
projects_dir=$config_dir/$projects_dir_subpath
initializations_dir_subpath=initializations/default
initializations_dir=$config_dir/$initializations_dir_subpath

directories=($services_dir $projects_dir $initializations_dir)

for directory in ${directories[@]}
do
    if [ ! -d "$directory" ]; then
        mkdir -p $directory
    fi
done

\cp -rf $services_dir_subpath/* \
    $services_dir/

\cp -rf $projects_dir_subpath/* \
    $projects_dir/

\cp -rf $initializations_dir_subpath/* \
    $initializations_dir/
