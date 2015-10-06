module Kiik
  class Resource
    include HTTParty

    attr_accessor :id, :created, :errors

    class << self
      def class_name
        self.name.split('::')[-1]
      end

      def url
        "#{Kiik.host}/#{Kiik::Util.underscore(class_name)}s"
      end

      def opts
        {
          basic_auth: {username: Kiik.api_key, password: ''},
          headers: {
            "Accept-Version" => Kiik.version,
            "Content-Type" => 'application/json'
          }
        }
      end

      def build(data, error = nil)
        instance = self.new(data)
        instance.errors = error.errors unless error.nil?
        instance
      end
    end

    def initialize(attributes = {})
      attributes.each{ |name, value| self.instance_variable_set("@#{name}", value) }
      self.errors = []
    end

    def valid?
      self.errors.empty?
    end

    def to_json(attrs = [:id, :created])
      result = {}
      attrs.each{ |attr|
        value = self.instance_variable_get("@#{attr}")
        result[attr] = value unless value.nil? or value.empty?
      }
      result
    end
  end
end
