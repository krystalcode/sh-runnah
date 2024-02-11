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
    app-create \
    app-down \
    app-enter \
    app-env-build \
    app-init \
    app-logs \
    app-restart \
    app-up \
    /usr/local/bin/

\cp services/default/* \
    /etc/app-pod/conf.d/services/default/
projects_dir_subpath=projects/default
projects_dir=$config_dir/$projects_dir_subpath
initializations_dir=$config_dir/$initializations_dir_subpath

\cp -rf $projects_dir_subpath/* \
    $projects_dir/

\cp -rf $initializations_dir_subpath/* \
    $initializations_dir/
