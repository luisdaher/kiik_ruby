module Kiik
  class Charge < Resource
    include Kiik::Rest::Create
    include Kiik::Rest::Cancel
    include Kiik::Rest::Capture

    attr_accessor :customer, :amount, :receipt_email, :destination,
                  :description, :statement_descriptor, :status, :intermediaries,
                  :expected_compensation
  end
end
