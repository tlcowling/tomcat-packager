#!/bin/bash
#
# Ensures directory is owned by the tomcat user
#
set -e

chown -R tomcat:tomcat /var/lib/tomcat
