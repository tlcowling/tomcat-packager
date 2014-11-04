#!/bin/bash
#
# Deletes the tomcat users, the old tomcat directory and the upstart script
#
set -e

if id -u $1 >/dev/null 2>&1; then
        userdel tomcat
else
        echo "user does not exist"
fi

rm -rf /var/lib/tomcat
rm -f /etc/init/tomcat.conf
