module Kiik
  class KiikError < StandardError
    attr_reader :errors
    def initialize(body = nil)
      if body
        @errors = [{attr: body['error']['param'], message: body['error']['message']}] if body
      else
        @errors = []
      end
    end

    def to_s
      @errors.map{ |e| e[:message] }.join(", ")
    end
  end
end
