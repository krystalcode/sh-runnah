#!/bin/bash

case $1 in
    build)
        app-build ${@:2}
        ;;

    *)
        echo "Invalid command $1"
        ;;
esac
