namespace :kiik do
  desc 'Create config file for kiik'
  task :config do
    relative_config = './config/kiik.yml'
    src = File.join(
      File.dirname(
        File.expand_path(__FILE__)
      ),
      "../../#{relative_config}.sample"
    )
    dst = File.expand_path(relative_config, ENV['BUNDLE_GEMFILE'])
    if File.exist? dst
      puts 'Config file already exists'
    else
      FileUtils.cp src, dst
      puts 'Config file created'
    end
  end
end
