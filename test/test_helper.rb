require 'kiik'
require 'test/unit'
require 'mocha/setup'
require 'shoulda'
require 'webmock/test_unit'
require File.expand_path('../test_mock.rb', __FILE__)

class Test::Unit::TestCase
  include Mocha
  include Kiik::TestMock

  setup do
    Kiik.setup do |config|
      config.api_key = '123'
      config.version = '0.3'
      config.host = 'http://api.kiik.com'
    end
  end
end
