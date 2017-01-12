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
  class << self
    attr_accessor :api_key, :version, :environment

    def host
      @environment == 'production' ? 'http://api.kiik.com' : 'http://demo.kiik.com'
    end
  end
end
