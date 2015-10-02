module Kiik
  class Customer < Resource
    include Kiik::Rest::Create

    attr_accessor :phone, :name, :document, :email, :metadata, :description, :cards
  end
end
