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
  if ENV['KIIK_ENV'] == 'production'
    @host = 'https://api.kiik.com'
  else
    @host = 'https://demo.kiik.com'
  end

  @version = ENV['KIIK_VERSION']
  @api_key = ENV['KIIK_KEY']

  unless @host && @version && @api_key
    puts "Warning: environment variables 'KIIK_KEY', 'KIIK_ENV' and 'KIIK_VERSION' aren't set yet."
    puts 'Please assign them in order for Kiik integration to work.'
  end

  class << self
    attr_accessor :api_key, :host, :version
  end
end
