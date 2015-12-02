module Kiik
  class KiikError < StandardError
    attr_reader :errors
    def initialize(body = nil)
      @errors = body.nil? || body["errors"].nil? ? [] : body["errors"].map{ |error| symbolize_keys(error) }
    end

    def to_s
      @errors.map{ |e| e[:param].nil? ? e[:message] : "#{e[:param]}: #{e[:message]}" }.join(", ")
    end

    private

    def symbolize_keys(hash)
      Hash[hash.map{|(k,v)| [k.to_sym,v]}]
    end

  end
end
