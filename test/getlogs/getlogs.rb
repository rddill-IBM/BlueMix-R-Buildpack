#!/usr/bin/env ruby

require 'rubygems'
require 'cfoundry'

creds = { :username => ARGV[0], :password => ARGV[1] }
app_name = ARGV[2]

files_to_dl = ['logs/staging.log', 'logs/stderr.log', 'logs/stdout.log']

c = CFoundry::Client.get "http://api.run.pivotal.io"
c.login creds

app = c.app_by_name app_name

files_to_dl.each do |file|
  begin
    content = app.file(file)

    local_path = file.match(/\/([^\/]+)$/)[1]
    File.open(local_path, 'w') { |f| f.write(content) }

  rescue CFoundry::NotFound
    puts "404!"
  end
end