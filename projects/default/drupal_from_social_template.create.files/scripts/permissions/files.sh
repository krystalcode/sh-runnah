#!/bin/bash
# This script should be called from the folder it is located.

export $(grep -v '^#' $PWD/../../.env | xargs)

# Require strict variable naming: This prevents problems with mistyped variable
# names or mistakes in this script.
set -u

# Public file permissions.
echo "Setting file ownership/permissions for public files."
chown -R ${APP_APP_OS_USER}:${APP_PHP_OS_GROUP} ${APP_PUBLIC_FILES_DIR}
chmod -R g+w ${APP_PUBLIC_FILES_DIR}
find ${APP_PUBLIC_FILES_DIR} -type d -exec chmod 2775 {} \;
find ${APP_PUBLIC_FILES_DIR} -type f -exec chmod 644 {} \;

# Private file permissions.
echo "Setting file ownership/permissions for private files."
chown -R ${APP_APP_OS_USER}:${APP_PHP_OS_GROUP} ${APP_PRIVATE_FILES_DIR}
chmod -R g+w ${APP_PRIVATE_FILES_DIR}
find ${APP_PRIVATE_FILES_DIR} -type d -exec chmod 2770 {} \;
find ${APP_PRIVATE_FILES_DIR} -type f -exec chmod 640 {} \;
