#!/bin/bash
#
# Stops the tomcat service
#
if [ -f /etc/init/tomcat.conf ]; then
  echo "checking if tomcat is running..."
  service tomcat status | grep "running"
  if [ $? != 1 ]; then
    echo "stopping tomcat since it was running"
    service tomcat stop
  fi
fi

exit 0
