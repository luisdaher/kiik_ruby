module Kiik
  module Rest
    module Create
      class << self
        def included(base)
          base.extend(ClassMethods)
        end
      end

      module ClassMethods
        def create(params={})
          puts url, params
          nil
        end
      end
    end
  end
end
