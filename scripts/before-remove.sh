#!/bin/bash
#
# Stops the tomcat service
#
set -e

if [ -f /etc/init/tomcat.conf ]; then
  service tomcat stop
fi
