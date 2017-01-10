require 'kiik'
require 'test/unit'
require 'mocha/setup'
require 'shoulda'
require 'webmock/test_unit'
require File.expand_path('../test_mock.rb', __FILE__)

module Test
  module Unit
    # Unit Test configurations
    class TestCase
      include Mocha
      include Kiik::TestMock

      setup do
        Kiik.host = 'http://example.com'
        Kiik.version = 'TEST_VERSION'
        Kiik.api_key = 'TEST_KEY'
      end
    end
  end
end
