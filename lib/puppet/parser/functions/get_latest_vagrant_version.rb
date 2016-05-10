require 'json'
require 'open-uri'

module Puppet::Parser::Functions
  newfunction(:get_latest_vagrant_version, :type => :rvalue) do |args|
    # tags = JSON.parse(open('https://api.github.com/repos/mitchellh/vagrant/tags') { |u| u.read })
    # tags.sort_by { |tag| tag['name'] }.last['name'][1..-1]
    #JSON.parse(open('https://releases.hashicorp.com/vagrant/index.json') { |u| u.read })["version"]
    (((JSON.parse(open('https://releases.hashicorp.com/vagrant/index.json') { |u| u.read } ))["versions"]).map {|key, val| key.dup.to_s}).map {|v| Gem::Version.new v.to_s}.max.to_s
  end
end
