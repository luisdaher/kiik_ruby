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

      def request(path=nil, params={}, method=:GET)
        options = opts.merge!(body: JSON.generate(params))
        url_abs = path.nil? ? url : "#{url}/#{path}"
        case method
        when :GET
          response = get(url_abs, options)
        when :POST
          response = post(url_abs, options)
        when :PUT
          response = put(url_abs, options)
        else
          StandardError.new("Method #{method} not implemented")
        end

        case response.code
        when 200
          build(JSON.parse(response.body))
        when 404
        when 422
          result = JSON.parse(response.body)
          result["error"]["param"] = "id" unless result["error"]["param"]
          KiikError.new(result)
        else
          StandardError.new(response.message)
        end
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
