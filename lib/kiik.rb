require 'yaml'
require 'httparty'

require 'kiik/rest/create'
require 'kiik/rest/update'
require 'kiik/rest/get_all'
require 'kiik/util'
require 'kiik/resource'
require 'kiik/card'
require 'kiik/customer'
require 'kiik/charge'
require 'kiik/payment'
require 'kiik/error'
require 'kiik/paginated'
require 'kiik/configuration'

module Kiik
  class << self
    attr_accessor :configuration
  end

  def self.setup
    self.configuration ||= Kiik::Configuration.new
    yield configuration
  end
end
