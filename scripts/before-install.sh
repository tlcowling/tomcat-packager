#!/bin/bash
#
# Creates the tomcat users if they don't already exist
# Creates a log directory for the service
#
set -e

id -u tomcat &>/dev/null || sudo useradd tomcat
id --group tomcat &>/dev/null || sudo groupadd tomcat

mkdir -p /var/log/tomcat
chown tomcat:tomcat /var/log/tomcat
