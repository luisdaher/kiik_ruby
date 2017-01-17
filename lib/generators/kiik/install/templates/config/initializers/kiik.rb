KIIK_ENV = ENV['KIIK_ENV'] || 'development'
KIIK_CONFIG = YAML.load_file("#{Rails.root}/config/kiik.yml")[KIIK_ENV]

Kiik.setup do |config|
  config.host = KIIK_CONFIG['host']
  config.api_key = KIIK_CONFIG['api_key']
  config.version = KIIK_CONFIG['version']
end
