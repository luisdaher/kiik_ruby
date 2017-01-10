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

# Module that encapsulates Kiik's object representations
module Kiik
  relative_config = './config/kiik.yml'
  path = File.expand_path(relative_config)

  env = ENV['KIIK_ENV'] || 'development'

  if ENV['KIIK_KEY'] && ENV['KIIK_HOST'] && ENV['KIIK_VERSION']
    @host = ENV['KIIK_HOST']
    @version = ENV['KIIK_VERSION']
    @api_key = ENV['KIIK_KEY']
  elsif File.exist? path
    config = YAML.load(ERB.new(File.read(path)).result)
    @host = config[env]['host']
    @version = config[env]['version']
    @api_key = config[env]['api_key']
  else
    puts "Warning: Config file doesn't exist at #{path}"
    puts "If you're using Rails, try running `rails g kiik:install`,"
    puts 'or please assign them as environment variables.'
    puts '(see README.md for further details)'
  end

  class << self
    attr_accessor :api_key, :host, :version
  end
end
