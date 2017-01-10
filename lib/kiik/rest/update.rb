module Kiik
  module Rest
    module Update
      class << self
        def included(base)
          base.extend(ClassMethods)
        end
      end

      def update
        result = self.class.update(to_json)
        raise result if result.instance_of? StandardError

        if result.instance_of? KiikError
          self.errors = result.errors
          return false
        end

        initialize(result.to_json)
        true
      end

      module ClassMethods
        def update!(params = {id: 0}, header = {})
          update(params, header)
        rescue KiikError => e
          build(params, e)
        rescue StandardError => e
          raise e
        end

        def update(params = {id: 0}, header = {})
          result = request(params[:id], params, :PUT, header)
          raise result if result.is_a? StandardError
          result
        end
      end
    end
  end
end
