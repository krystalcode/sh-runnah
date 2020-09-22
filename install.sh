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
    app-env-build \
    app-logs \
    app-up \
    app-up-apache \
    app-up-mysql \
    app-up-ngrok \
    app-up-solr \
    app-enter \
    app-down \
    /usr/local/bin/
