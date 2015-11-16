module Kiik
  module Rest
    module Update
      class << self
        def included(base)
          base.extend(ClassMethods)
        end
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
          result = request(params)
          raise result if result.instance_of? StandardError or result.instance_of? KiikError
          result
        end

        def request(params)
          options = opts.merge!({:body => JSON.generate(params)})
          response = put url + "/" + params['id'], options
          response.body
          case response.code
          when 200
            build(JSON.parse(response.body))
          when 422
            KiikError.new(JSON.parse(response.body))
          else
            StandardError.new(response.message)
          end
        end
      end

      def updated
        updated = false
        result = self.class.request(self.to_json)
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
    end
  end
end
