require 'yaml'

require 'kiik/version'
require 'kiik/util'

require 'kiik/resource'
require 'kiik/rest/create'

require 'kiik/card'
require 'kiik/customer'
require 'kiik/charge'

module Kiik
  path = File.expand_path('../../config/payos.yml', __FILE__)
  config = YAML.load_file(path)
  env = ENV['PAYOS_ENV'] || 'development'

  @host = config[env]['host']
  @version = config[env]['version']
end
