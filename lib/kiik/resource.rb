module Kiik
  class Resource

    def self.class_name
      self.name.split('::')[-1]
    end

    def self.url
      "/#{Util.underscore(class_name)}s"
    end

    def url
      unless id = self['id']
        raise InvalidRequestError.new("Could not determine which URL to request: #{self.class} instance has invalid ID: #{id}", 'id')
      end
      "#{self.class.url}/#{id}"
    end

  end
end
