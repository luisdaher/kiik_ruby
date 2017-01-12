module Kiik
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      desc "Copy kiik.rb initializer file to your application."

      def self.source_root
        @source_root ||= File.expand_path(File.join(File.dirname(__FILE__),
                                                    'templates'))
      end

      def copy_config_file
        template 'config/initializers/kiik.rb'
      end
    end
  end
end
