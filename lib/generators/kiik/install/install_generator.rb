module Kiik
  module Generators
    # Configuration files generator
    class InstallGenerator < ::Rails::Generators::Base
      desc 'Copy kiik.yml file to the application config directory.'

      def self.source_root
        @source_root ||= File.expand_path(
          File.join(File.dirname(__FILE__), 'templates')
        )
      end

      def copy_config_file
        template 'config/kiik.yml'
        template 'config/initializers/kiik.rb'
      end
    end
  end
end
