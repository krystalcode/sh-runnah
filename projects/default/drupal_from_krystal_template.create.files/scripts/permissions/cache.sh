#!/bin/bash
# This script should be called from the folder it is located.

export $(grep -v '^#' $PWD/../../.env | xargs)

# Require strict variable naming: This prevents problems with mistyped variable
# names or mistakes in this script.
set -u

echo "Setting file ownership/permissions for all cache files and folders."
find $APP_CACHE_DIR -exec chown ${APP_APP_OS_USER}:${APP_PHP_OS_GROUP} {} \;
find $APP_CACHE_DIR -type f -exec chmod 660 {} \;
find $APP_CACHE_DIR -type d -exec chmod 770 {} \;
