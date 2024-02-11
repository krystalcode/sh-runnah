#!/bin/bash

tmp_folder=tmp-a7vx888

cp -rf /etc/app-pod/conf.d/projects/default/${APP_CREATE_TEMPLATE}.create.files/* ${PWD}/

source /usr/local/bin/app-build

p run \
  --rm \
  --name ${APP_CONTAINER_POD_NAME}_git \
  --volume ${PWD}:/app \
  --volume $APP_IDE_HOME/.ssh:/root/.ssh \
  --workdir /app \
  krystalcode/f_ide \
  /bin/bash -c "git clone -b ${APP_CREATE_GIT_BRANCH} ${APP_CREATE_GIT_URL} $tmp_folder"

if [ -d "${PWD}/scripts/permissions" ]; then
    mv ${PWD}/scripts/permissions ${PWD}/$tmp_folder/scripts
fi

# @I Prepare settings.local.php file
# @I Create the private files directory

shopt -s dotglob
mv ${PWD}/$tmp_folder/* ${PWD}/
rm -rf ${PWD}/$tmp_folder

p run \
  --rm \
  --name ${APP_CONTAINER_POD_NAME}_git \
  --volume ${PWD}:/app \
  --workdir /app \
  krystalcode/f_ide \
  /bin/bash -c "git remote rename origin ${APP_CREATE_GIT_REMOTE_NAME}"
