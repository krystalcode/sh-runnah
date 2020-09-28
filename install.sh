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
    app-down \
    app-enter \
    app-env-build \
    app-logs \
    app-up \
    /usr/local/bin/

\cp services/default/* \
    /etc/app-pod/conf.d/services/default/
