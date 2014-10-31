require 'open-uri'

task :default => :package

desc 'Download tomcat7 and package it as a debian'
task :package => [:clean, :fetch, :build]

desc 'Download packages' 
task :fetch do
  open('./downloads/tomcat7.tar.gz.asc', 'wb') do |file|
    file << open('https://www.apache.org/dist/tomcat/tomcat-7/v7.0.56/bin/apache-tomcat-7.0.56.tar.gz.asc').read
  end
  open('./downloads/tomcat7.tar.gz.md5', 'wb') do |file|
    file << open('https://www.apache.org/dist/tomcat/tomcat-7/v7.0.56/bin/apache-tomcat-7.0.56.tar.gz.md5').read
  end
  open('./downloads/tomcat7.tar.gz', 'wb') do |file|
    file << open('http://www.whoishostingthis.com/mirrors/apache/tomcat/tomcat-7/v7.0.56/bin/apache-tomcat-7.0.56.tar.gz').read
  end
end

desc 'Clean tars'
task :clean do
  system 'rm -iv ./pkg/*'
end

desc 'Build tomcat package'
task :build do

end
