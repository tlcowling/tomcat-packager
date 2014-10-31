#!/bin/bash
#
# Uses fpm to build a debian package
#
set -e

fpm -s dir  -t deb --name=tomcat --version=7.0.56 --force --before-install=scripts/before-install.sh --after-remove=scripts/after-remove.sh --architecture=amd64 --deb-user=tomcat7 --deb-group=tomcat7 --prefix=/var/lib/ --deb-init=etc/init.d/tomcat7 --deb-default=etc/default/tomcat7 ./downloads/tomcat7
