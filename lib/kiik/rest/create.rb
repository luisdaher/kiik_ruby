module Kiik
  module Rest
    module Create
      class << self
        def included(base)
          base.extend(ClassMethods)
        end
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
          result = request(params)
          raise result if result.instance_of? StandardError or result.instance_of? KiikError
          result
        end

        def request(params)
          options = opts.merge!({:body => params})
          puts "Requet", url, options
          response = post url, options
          puts "Responde", response.inspect
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

      def create
        created = false
        result = self.class.request(self.to_json)
        if result.instance_of? KiikError
          @errors = result.errors
        elsif result.instance_of? StandardError
          raise result
        else
          @errors = []
          initialize(result.to_json)
          created = true
        end
        created
      end
    end
  end
end
