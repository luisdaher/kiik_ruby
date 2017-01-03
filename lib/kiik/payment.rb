module Kiik
  class Payment < Resource
    include Kiik::Rest::GetAll

    attr_accessor :status, :received_at, :history_type, :expected_compensation_date,
      :compensated_at, :charge_id, :amount, :amount_raw, :aditional_info, :total

    class << self
      def consolidated(customer = nil, start_date = nil, end_date = nil)
        url = customer.nil? ? '' : "#{customer}/"
        url += "consolidated"
        params = []
        params << "start_date=#{start_date.strftime('%Y-%m-%d %H:%M:%S')}" if start_date
        params << "end_date=#{end_date.strftime('%Y-%m-%d %H:%M:%S')}" if end_date
        url += "?#{params.join('&')}" if params.length
        result = request(url, {}, :GET, {})
        raise result if result.kind_of? StandardError
        result.total
      end

      def all(params = {})
        url = params[:customer].nil? ? '' : "#{params[:customer]}/"
        parameters = []
        parameters << "start_date=#{params[:start_date].to_s(:db)}" if params[:start_date]
        parameters << "end_date=#{params[:end_date].to_s(:db)}" if params[:end_date]
        parameters << "page=#{params[:page]}" if params[:page]
        parameters << "page_size=#{params[:page_size]}" if params[:page_size]
        url += "?#{parameters.join('&')}" if parameters.length
        result = request(url, {}, :GET, {})
        raise result if result.kind_of? StandardError
        result
      end
    end

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
        :amount_raw,
        :aditional_info
      ]))
    end
  end
end
