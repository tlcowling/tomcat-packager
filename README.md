tomcat-packager
===============

Packages Tomcat - because its always nice to control your packages...

## Description
Initially its going to use fpm to create an ubuntu package for tomcat7. 
I'm going to use the
  1. Make it work
  2. Make it right
  3. Make it fast

approach

## How
Requires Ruby 1.9.3+

Get gem dependencies

``bundle install``

Use rake to download packages, then build them.  Output is currently a deb file

``rake package``

Then you'll want to apt-get install tomcat, once you've hosted it!  Recommend [aptly](http://www.aptly.info)

## Caveats

Manage Java yourself separately.  Ubuntu tomcat packages have a hard dependency on openjdk 6, sometimes we need to use the Oracle one...  

## Future stuff? (todo)
Use pgp to verify the download
Make the hardcoded paths less hardcoded
Add a LICENSE to the deb
Add a maintainer explicitly
Might get you a different tomcat version...
Might also be able to make you a yum package...
Might prompt you for info...
