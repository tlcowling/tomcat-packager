#!/bin/bash
#
# Creates the tomcat users
#
set -e

id -u tomcat7 &>/dev/null || sudo useradd tomcat7
id --group tomcat7 &>/dev/null || sudo groupadd tomcat7
