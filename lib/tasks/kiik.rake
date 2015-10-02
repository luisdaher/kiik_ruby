namespace :kiik do
  desc 'Create config file for kiik'
  task :config do
    relative_config = 'config/kiik.yml'
    src = File.expand_path("../../../#{relative_config}", __FILE__)
    dst = File.expand_path(relative_config, ENV["BUNDLE_GEMFILE"])
    unless File.exist? dst
      FileUtils.cp src, dst
      puts "Config file created"
    else
      puts "Config file already exists"
    end
  end
end
