module Kiik
  module Rest
    module Create
      class << self

        def included(base)
          base.extend(ClassMethods)
        end

      end

      def create
        result = self.class.create(self.to_json)
        raise result if result.instance_of? StandardError

        if result.instance_of? KiikError
          self.errors = result.errors
          return false
        end

        initialize(result.to_json)
        true
      end

      module ClassMethods

        def create!(params={}, header={})
          begin
            create(params, header)
          rescue KiikError => e
            build(params, e)
          rescue StandardError => e
            e
          end
        end

        def create(params={}, header={})
          result = request(nil, params, :POST, header)
          raise result if result.kind_of? StandardError
          result
        end
      end

    end
  end
end
