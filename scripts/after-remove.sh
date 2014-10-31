#!/bin/bash
#
# Deletes the tomcat users
#
set -e

if id -u $1 >/dev/null 2>&1; then
        userdel tomcat7
else
        echo "user does not exist"
fi
