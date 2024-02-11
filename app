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
        app-build ${@:2}
        ;;

    down)
        app-down ${@:2}
        ;;

    enter)
        app-enter ${@:2}

    init)
        $bin_dir/app-init "${@:2}"
        ;;

    logs)
        app-logs ${@:2}
        ;;

    restart)
        app-restart ${@:2}
        ;;

    up)
        app-up ${@:2}
        ;;

    *)
        echo "Invalid command $1"
        ;;
esac
