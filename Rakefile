require 'open-uri'
require 'progressbar'

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
end

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

    system 'mkdir -p downloads/tomcat && tar xzf downloads/tomcat7.tar.gz -C downloads/tomcat --strip-components=1'
  
end

desc 'Verify download integrity'
task :verify_md5 do
  downloaded_md5 = Digest::MD5.file('./downloads/tomcat7.tar.gz').hexdigest
  expected_md5 = `grep -Eo '^[^ ]+' downloads/tomcat7.tar.gz.md5`.strip
  fail("Not building since md5 sums do not match, #{downloaded_md5} not equal to expected md5sum #{expected_md5}") unless downloaded_md5.eql? expected_md5
end

desc 'Verify download authenticity'
task :verify_pgp do
  #pgp_key = `gpg downloads/tomcat7.tar.gz.asc | awk '{print $14}'`
  #p pgp_key
end

desc 'Clean downloads folder and previous packages'
task :clean do
  puts 'Removing previous downloads and previous packages'
  FileUtils.rm_rf(Dir.glob('downloads/*'))
  FileUtils.rm_rf(Dir.glob('./*.deb'))
end

desc 'Build tomcat package'
task :build => :verify_md5 do
  system 'fpm -s dir -t deb --name=tomcat --description="Servlet and JSP engine" --maintainer "Tom Cowling <tom@tlcowling.com>" --license=MIT --version=7.0.56 --force --before-install=scripts/before-install.sh --after-install=scripts/after-install.sh --after-remove=scripts/after-remove.sh --architecture=amd64 --deb-user=tomcat --deb-group=tomcat --deb-default=etc/default/tomcat downloads/tomcat/=/var/lib/tomcat etc/init/tomcat.conf=/etc/init/tomcat.conf'
#etc/init/tomcat.conf=/etc/init/tomcat.conf downloads/tomcat/conf=/etc/tomcat'
end
