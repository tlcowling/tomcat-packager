tomcat-packager
===============

Packages Tomcat - because its always nice to control your packages...

## Description
Initially its going to use fpm to create an ubuntu package for tomcat7.  

## How
Use rake to download packages, then build them.  Output is in the pkg directory

``rake package``

## Future stuff? (todo)
Might get you a different tomcat version...
Might also be able to make you a yum package...
Might prompt you for info...
