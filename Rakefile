require 'open-uri'
require 'progressbar'

task :default => :package

desc 'Download tomcat7 and package it as a debian'
task :package => [:clean, :download, :build]

desc 'Download packages' 
task :download do
  puts 'Download in progress...'
  open('./downloads/tomcat7.tar.gz.asc', 'wb') do |file|
    file << open('https://www.apache.org/dist/tomcat/tomcat-7/v7.0.56/bin/apache-tomcat-7.0.56.tar.gz.asc').read
  end
  open('./downloads/tomcat7.tar.gz.md5', 'wb') do |file|
    file << open('https://www.apache.org/dist/tomcat/tomcat-7/v7.0.56/bin/apache-tomcat-7.0.56.tar.gz.md5').read
  end
  open('./downloads/tomcat7.tar.gz', 'wb',
    :content_length_proc => lambda {|t|
      if t && 0 < t
        pbar = ProgressBar.new("...", t)
        pbar.file_transfer_mode
      end
    },
    :progress_proc => lambda {|s|
      pbar.set s if pbar
    }) do |file|
      file << open('http://www.whoishostingthis.com/mirrors/apache/tomcat/tomcat-7/v7.0.56/bin/apache-tomcat-7.0.56.tar.gz').read
    end

    system 'mkdir -p downloads/tomcat7 && tar xzf downloads/tomcat7.tar.gz -C downloads/tomcat7 --strip-components=1'
  
end

desc 'Clean tars'
task :clean do
  puts 'Removing previous downloads and previous packages'
  FileUtils.rm_rf(Dir.glob('downloads/*'))
  FileUtils.rm_rf(Dir.glob('./*.deb'))
end

desc 'Build tomcat package'
task :build do
  system 'fpm -s dir  -t deb --name=tomcat --version=7.0.56 --force --before-install=scripts/before-install.sh --after-remove=scripts/after-remove.sh --architecture=amd64 --deb-user=tomcat7 --deb-group=tomcat7 --prefix=/var/lib/ --deb-init=etc/init.d/tomcat7 --deb-default=etc/default/tomcat7 ./downloads/tomcat7'
end
