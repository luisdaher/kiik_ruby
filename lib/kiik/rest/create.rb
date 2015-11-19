module Kiik
  module Rest
    module Create
      class << self

        def included(base)
          base.extend(ClassMethods)
        end

      end

      def create
        created = false
        result = self.class.create(self.to_json)
        if result.instance_of? KiikError
          self.errors = result.errors
        elsif result.instance_of? StandardError
          raise result
        else
          initialize(result.to_json)
          created = true
        end
        created
      end

      module ClassMethods

        def create!(params={})
          begin
            create(params)
          rescue KiikError => e
            build(params, e)
          rescue StandardError => e
            e
          end
        end

        def create(params={})
          result = request(nil, params, :POST)
          raise result if result.kind_of? StandardError
          result
        end
      end

    end
  end
end
