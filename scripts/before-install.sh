#!/bin/bash
#
# Creates the tomcat users
#
set -e

id -u tomcat &>/dev/null || sudo useradd tomcat
id --group tomcat &>/dev/null || sudo groupadd tomcat
