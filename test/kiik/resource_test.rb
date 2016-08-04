require File.expand_path('../../test_helper', __FILE__)

module Kiik
  class ResourceTest < Test::Unit::TestCase

    should "" do
      respond = {errors: [{type:"invalid_request_error", param:"name", message:"Param name is required"}]}
      post({}, respond, 422)
      assert_raise KiikError do
        Kiik::Customer.create
      end
    end

  end
end
