require 'kiik'
require 'rails'
module Kiik
  class Railtie < Rails::Railtie
    railtie_name :kiik

    rake_tasks do
      load "tasks/kiik.rake"
    end
  end
end
