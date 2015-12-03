module Kiik
  class Card < Resource
    include Kiik::Rest::Create
    include Kiik::Rest::Update

    attr_accessor :customer_id, :name, :number, :month, :year, :cvc, :card_alias, :cvc_check

    class << self

      def check!(params)
        update!(params)
      end

      def check(params)
        update(params)
      end

    end
  end
end
