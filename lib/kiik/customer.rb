module Kiik
  class Customer < Resource
    include Kiik::Rest::Create

    attr_accessor :phone, :name, :document, :email, :metadata, :description, :cards

    def initialize(attributes = {})
      super(attributes)
      @cards = @cards.map{ |card| Card.new(card) } unless @cards.nil?
    end

    def to_json
      super.merge!(
        phone: @phone,
        name: @name,
        document: @document,
        email: @email,
        metadata: @metadata,
        description: @description,
        cards: @cards
      )
    end
  end
end
