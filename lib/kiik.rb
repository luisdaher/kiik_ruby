require 'yaml'
require 'httparty'

require 'kiik/rest/create'
require 'kiik/rest/update'
require 'kiik/util'
require 'kiik/resource'
require 'kiik/card'
require 'kiik/customer'
require 'kiik/charge'
require 'kiik/error'

module Kiik
  relative_config = '../config/kiik.yml'
  path = File.expand_path(relative_config, ENV["BUNDLE_GEMFILE"])

  unless File.exist? path
    puts "Warning: Config file not exist (#{path}), try `rake kiik:config`, using DEMO by default"
    path = File.expand_path("../#{relative_config}", __FILE__)
  end

  config = YAML.load_file(path)
  env = ENV['KIIK_ENV'] || 'development'

  @host = config[env]['host']
  @version = config[env]['version']
  @api_key = config[env]['api_key']

  class << self
    attr_accessor :api_key, :host, :version
  end
end
