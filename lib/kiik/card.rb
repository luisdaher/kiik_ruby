module Kiik
  class Card < Resource
    include Kiik::Rest::Create

    attr_accessor :customer_id, :name, :number, :month, :year, :cvc, :card_alias
  end
end
