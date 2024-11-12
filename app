#!/bin/bash
#
# Entrypoint; delegates to the right script.
#
# @I Add `exec` script for running commands in a service container
#    type     : feature
#    priority : normal
#    labels   : exec
#
# @I Add `restart` script for restarting services
#    type     : feature
#    priority : normal
#    labels   : service

bin_dir=/usr/local/bin

case $1 in
    build)
        $bin_dir/app-build "${@:2}"
        ;;

    clean)
        $bin_dir/app-clean "${@:2}"
        ;;

    create)
        $bin_dir/app-create "${@:2}"
        ;;

    down)
        $bin_dir/app-down "${@:2}"
        ;;

    enter)
        $bin_dir/app-enter "${@:2}"
        ;;

    exec)
        $bin_dir/app-exec "${@:2}"
        ;;

    init)
        $bin_dir/app-init "${@:2}"
        ;;

    logs)
        $bin_dir/app-logs "${@:2}"
        ;;

    restart)
        $bin_dir/app-restart "${@:2}"
        ;;

    stop)
        $bin_dir/app-stop "${@:2}"
        ;;

    up)
        $bin_dir/app-up "${@:2}"
        ;;

    *)
        echo "Invalid command $1"
        ;;
esac
