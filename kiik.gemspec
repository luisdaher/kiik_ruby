$:.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'kiik/version'

spec = Gem::Specification.new do |s|
  s.name = 'kiik'
  s.version = Kiik::VERSION
  s.summary = 'Integrate Kiik with your Ruby app'
  s.description = 'Gem that helps you to integrate with our services. See https://kiik.com.br for details.'
  s.authors = ['Julien Lucca', 'Esdras Eduardo']
  s.email = ['lucca@kiik.com', 'esdras.rosa@kiik.com']
  s.homepage = 'http://docs.kiik.com'
  s.license = 'MIT'

  s.add_development_dependency('mocha', '~> 0.13')
  s.add_development_dependency('shoulda', '~> 3.5')
  s.add_development_dependency('test-unit', '~> 3.1')
  s.add_development_dependency('rake', '~> 10.4')

  s.files = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- test/*`.split("\n")
  s.require_paths = ['lib']
end
