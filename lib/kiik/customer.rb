module Kiik
  class Customer < Resource
    include Kiik::Rest::Create

    attr_accessor :phone, :name, :email, :metadata, :description, :cards
  end
end
