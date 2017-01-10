require 'yaml'
require 'httparty'

require 'kiik/rest/create'
require 'kiik/rest/update'
require 'kiik/rest/list'
require 'kiik/util'
require 'kiik/resource'
require 'kiik/card'
require 'kiik/customer'
require 'kiik/charge'
require 'kiik/payment'
require 'kiik/error'
require 'kiik/paginated'
require 'kiik/railtie' if defined?(Rails)

# Module that encapsulates Kiik's object representations
module Kiik
  relative_config = './config/kiik.yml'
  path = File.expand_path(relative_config, ENV['BUNDLE_GEMFILE'])

  env = ENV['KIIK_ENV'] || 'development'

  if File.exist? path
    config = YAML.load_file(path)
    @host = config[env]['host']
    @version = config[env]['version']
    @api_key = config[env]['api_key']
  else
    puts "Warning: Config file doesn't exist (#{path}), try `rake kiik:config`"
  end

  class << self
    attr_accessor :api_key, :host, :version
  end
end
