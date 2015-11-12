module Kiik
  class KiikError < StandardError
    attr_reader :errors
    def initialize(body = nil)
      @errors = body.nil? ? [] : [{attr: body['error']['param'], message: body['error']['message']}]
    end
      
    def to_s
      @errors.map{ |e| e[:message] }.join(", ")
    end
  end
end
