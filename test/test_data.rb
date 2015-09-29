module Kiik
  module TestData

    def make_response(body, code=200)
      # When an exception is raised, restclient clobbers method_missing.  Hence we
      # can't just use the stubs interface.
      body = JSON.generate(body) if !(body.kind_of? String)
      m = mock
      m.instance_variable_set('@stripe_values', {
        :body => body,
        :code => code,
        :headers => {},
      })
      def m.body; @stripe_values[:body]; end
      def m.code; @stripe_values[:code]; end
      def m.headers; @stripe_values[:headers]; end
      m
    end
    
    def make_customer(params={})
      id = params[:id] || 'c_test_customer'
      {
        :subscription_history => [],
        :bills => [],
        :charges => [],
        :livemode => false,
        :object => "customer",
        :id => id,
        :default_card => "cc_test_card",
        :created => 1304114758,
        :sources => make_customer_card_array(id),
        :metadata => {},
        :subscriptions => make_subscription_array(id)
      }.merge(params)
    end
    
  end
end