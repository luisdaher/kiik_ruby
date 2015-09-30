module Kiik
  class Resource

    class << self
      def class_name
        self.name.split('::')[-1]
      end

      def url
        "/#{Kiik::Util.underscore(class_name)}s"
      end
    end

    def url
      "#{self.class.url}/#{id}"
    end

  end
end
