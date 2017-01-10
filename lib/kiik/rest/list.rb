module Kiik
  module Rest
    module List
      class << self
        def included(base)
          base.extend(ClassMethods)
        end
      end
      def list
        result = self.class.list(to_json)
        raise result if result.instance_of? StandardError

        if result.instance_of? KiikError
          self.errors = result.errors
          return false
        end

        initialize(result.to_json)
        true
      end

      module ClassMethods
        def list!(params = {}, header = {})
          list(params, header)
        rescue KiikError => e
          build(params, e)
        rescue StandardError => e
          e
        end

        def list(params = {}, header = {})
          result = request(nil, params, :GET, header)

          raise result if result.is_a? StandardError
          result
        end
      end
    end
  end
end
