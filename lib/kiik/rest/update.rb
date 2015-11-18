module Kiik
  module Rest
    module Update
      class << self
        
        def included(base)
          base.extend(ClassMethods)
        end

      end

      def update
        updated = false
        result = self.class.update(self.to_json)
        if result.instance_of? KiikError
          self.errors = result.errors
        elsif result.instance_of? StandardError
          raise result
        else
          initialize(result.to_json)
          updated = true
        end
        updated
      end

      module ClassMethods

        def update!(params={})
          begin
            update(params)
          rescue KiikError => e
            build(params, e)
          rescue StandardError => e
            e
          end
        end

        def update(params={})
          raise StandardError.new "Update need id" if params['id'].nil?
          result = request(params['id'], params, 'PUT')
          raise result if result.kind_of? StandardError
          result
        end
      end
      
    end
  end
end
