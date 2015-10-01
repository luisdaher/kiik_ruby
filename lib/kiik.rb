require 'yaml'


puts "Kiik #{File.realpath __dir__}"

module Kiiki
  # path = File.expand_path('config/kiik.yml', __dir__)
  # config = YAML.load_file(path)
  # env = ENV['PAYOS_ENV'] || 'development'

  # @host = config[env]['host']
  # @version = config[env]['version']
  # @api_key = config[env]['api_key']
end
