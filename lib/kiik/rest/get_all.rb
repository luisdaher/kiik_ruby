module Kiik
  module Rest
    module GetAll
      class << self

        def included(base)
          base.extend(ClassMethods)
        end

      end
      def get_all
        result = self.class.get_all(self.to_json)
        raise result if result.instance_of? StandardError

        if result.instance_of? KiikError
          self.errors = result.errors
          return false
        end

        initialize(result.to_json)
        true
      end

      module ClassMethods

        def get_all!(params={}, header={})
          begin
            get_all(params, header)
          rescue KiikError => e
            build(params, e)
          rescue StandardError => e
            e
          end
        end

        def get_all(params={}, header={})

          result = request(nil, params, :GET, header)

          raise result if result.kind_of? StandardError
          result
        end
      end
    end
  end
end
