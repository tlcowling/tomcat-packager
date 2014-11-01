#!/usr/bin/env ruby

# Prompt the user for some criteria

require 'json'
require 'highline/import'

class Prompter
  def initialize
    start
  end

  def major_version version_string
    version_string.match(/\d+/)[0]
  end

  def start
    parameters = {}
    parameters[:version] = ask('What version of Tomcat?', String) { |q| q.default = "7.0.56" } 

    version = major_version parameters[:version]

    parameters[:user] = ask('Tomcat user?', String) { |q| q.default = "tomcat#{version}" }
    parameters[:group] = ask('Tomcat group?', String) { |q| q.default = "tomcat#{version}" }
    save_as_json(parameters)
  end

  def save_as_json parameters
    json = parameters.to_json
    File.write 'test.json', json
  end
end
