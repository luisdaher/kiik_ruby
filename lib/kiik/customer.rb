module Kiik
  class Customer < Resource
    include Kiik::Rest::Create

    attr_accessor :phone, :name, :document, :email, :metadata, :description, :cards

    def initialize(attributes = {})
      super(attributes)
      @cards = @cards.nil? ? [] : @cards.map{ |card| Card.new(card) }
    end

    def to_json
      super.merge!(super([
        :phone,
        :name,
        :document,
        :email,
        :metadata,
        :description,
        :cards
      ]))
    end
  end
end
