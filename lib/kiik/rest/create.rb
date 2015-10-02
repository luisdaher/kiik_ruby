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
            build({}, e)
          rescue Error => e
            e
          end
        end

        def create(params={})
          options = opts.merge!({:body => params})
          response = post url, options
          response.body
          case response.code
          when 200
            build(JSON.parse(response.body))
          when 422
            raise KiikError.new(JSON.parse(response.body))
          else
            raise Error.new(response.message)
          end
        end
      end
    end
  end
end
