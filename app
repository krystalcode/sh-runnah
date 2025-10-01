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
#
# @I Support default service per project
#    type     : feature
#    priority : normal
#    labels   : service
#    notes    : The purpose would be to run commands without specifying the
#               service. We will need to review the different cases and how to
#               handle commands that operate on the project/all services if a
#               service is not provided.
#
# @I Support defining and running commands per service
#    type     : feature
#    priority : normal
#    labels   : service
#    notes    : The purpose would be to run commands without having to enter the
#               container first.
#               Example: `a command apache my-command --option value`
#               Example: `a command mysql backup-command --file /path/to/db.sql`
#
# @I Support default command per service
#    type     : feature
#    priority : normal
#    labels   : service
#    notes    : Default command for a service: `a command apache`
#               Default command for the default service: `a command`
#
# @I Consider integrating with `just` for commands
#    type     : feature
#    priority : normal
#    labels   : service
#
# @I Globally store project details
#    type     : feature
#    priority : normal
#    labels   : project
#    notes    : Details stored globally should include path and aliases. Storage
#               could be a file at the user's home directory
#               e.g. `${HOME}/.runnah/projects.env`.
#
# @I Support project aliases
#    type     : feature
#    priority : normal
#    labels   : project
#
# @I Add `goto` command
#    type     : feature
#    priority : normal
#    labels   : command
#    notes    : Example: `a goto runnah` takes you to the project's root folder.
#               Example: `a runnah up` runs the `up` command for the project.
#
# @I Support passing different arguments/options to different tasks
#    type     : feature
#    priority : normal
#    labels   : service
#    notes    : Example: app build+up+[enter apache]
#
# @I Support smart start mode
#    type     : feature
#    priority : normal
#    labels   : usability
#    notes    : Detect the status of the project and do the following:
#               - If the container(s) exists, run the default command on the
#                 main container.
#               - Otherwise, if the image(s) exists, start the project, then all
#                 of the above.
#               - Otherwise, build the project, then all of the above.
#               Example: applications/ide/emacs.sh

source "/usr/local/bin/app-functions"

required_commands=("buildah" "podman")
.runnah.shared.require-commands "${required_commands[@]}"

if [ $# -eq 0 ]; then
    echo "Please provide the action to run"
    exit
fi

action=$1

declare -A aliases
for alias in "${!aliases[@]}"; do
    if [[ "$action" == "$alias" ]]; then
        action=${aliases[$alias]}
        break
    fi
done

IFS='+' read -ra TASKS <<< "$action"
if [ ${#TASKS[*]} -gt '1' ]
then
    for task in "${TASKS[@]}"; do
        $0 ${task} "${@:2}"
    done
    exit
fi

case $action in
    build|create|clean|down|enter|exec|init|logs|restart|stop|up)
        echo "Running the $action task"
        ;;
    *)
        echo "Error: Unsupported task $action"
        exit
        ;;
esac

bin_dir=/usr/local/bin

case $action in
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
