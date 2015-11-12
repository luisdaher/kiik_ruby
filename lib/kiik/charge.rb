module Kiik
  class Charge < Resource
    include Kiik::Rest::Create

    attr_accessor :customer_id, :amount, :receipt_email, :destination, :description, :statement_descriptor, :status, :intermediaries
  end
end
