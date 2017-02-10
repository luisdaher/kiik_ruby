module Kiik
  module Rest
    module Cancel
      class << self
        def included(base)
          base.extend(ClassMethods)
        end
      end

      def cancel
        result = self.class.cancel(to_json)
        raise result if result.instance_of? StandardError

        if result.instance_of? KiikError
          self.errors = result.errors
          return false
        end

        initialize(result.to_json)
        true
      end

      module ClassMethods
        def cancel!(params = { id: 0 }, header = {})
          cancel(params, header)
        rescue KiikError => e
          build(params, e)
        rescue StandardError => e
          raise e
        end

        def cancel(params = { id: 0 }, header = {})
          result = request("#{params[:id]}/cancel", params, :PUT, header)
          raise result if result.is_a? StandardError
          result
        end
      end
    end
  end
end
