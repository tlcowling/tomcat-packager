#!/bin/bash
#
# Deletes the tomcat users, and the old tomcat directory
#
set -e

if id -u $1 >/dev/null 2>&1; then
        userdel tomcat
else
        echo "user does not exist"
fi

rm -rf /var/lib/tomcat
