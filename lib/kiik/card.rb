module Kiik
  class Card < Resource
    include Kiik::Rest::Create

    attr_accessor :customer_id, :name, :number, :month, :year, :cvc, :card_alias

    def check
      Card.check customer_id, csv
    end

    class << self
      def check(customer_id, cvc)
        
      end
    end

  end
end
