module Kiik
  class Compensation < Resource
    include Kiik::Rest::GetAll

    attr_accessor :status, :received_at, :history_type, :expected_compensation_date,
      :compensated_at, :charge_id, :amount, :aditional_info

    def initialize(attributes = {})
      super(attributes)
    end

    def to_json
      super.merge!(super([
        :status,
        :received_at,
        :history_type,
        :expected_compensation_date,
        :compensated_at,
        :charge_id,
        :amount,
        :aditional_info
      ]))
    end
  end
end
