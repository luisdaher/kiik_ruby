module Kiik
  class Resource
    include HTTParty

    attr_accessor :id, :created

    class << self
      def class_name
        self.name.split('::')[-1]
      end

      def url
        "#{Kiik.host}/#{Kiik::Util.underscore(class_name)}s"
      end

      def opts
        {basic_auth: {username: Kiik.api_key, password: ''}, headers: {"Accept-Version" => Kiik.version}}
      end
    end

    def initialize(attributes = {})
      attributes.each { |name, value| self.instance_variable_set("@#{name}", value) }
    end
  end
end
