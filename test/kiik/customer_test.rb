require File.expand_path('../../test_helper', __FILE__)

module Kiik
  class CustomerTest < Test::Unit::TestCase
    should "create should return a new customer" do
      @mock.expects(:post).once.returns(make_response(make_customer))
      assert_equal "c_test_customer", Kiik::Customer.create().id
    end
  end
end
