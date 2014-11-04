#!/bin/bash
#
# Stops the tomcat service
#
set -e

if [ -f /etc/init/tomcat.conf ]; then
  service tomcat status | grep "running"
  if [ $? != 1 ]; then
    service tomcat stop
  fi
fi
