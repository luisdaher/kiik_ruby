# KiiK Ruby [![Build Status](https://snap-ci.com/kiik-payments/kiik_ruby/branch/master/build_image)](https://snap-ci.com/kiik-payments/kiik_ruby/branch/master) [![Inline docs](http://inch-ci.org/github/kiik-payments/kiik-ruby.svg?branch=master)](http://inch-ci.org/github/kiik-payments/kiik-ruby)

Gem for bindings with Kiik API

Requirements
--------------
* ruby    >= 2.2.3
* httpaty >= 0.13.7

Installation
--------------
### Gem
   `gem install kiik`

### Bundle
```ruby
source 'https://rubygems.org'
gem 'kiik'
```

Tasks
-----
### Configuration

#### Rails Apps

In order to generate config files, run:

```
rails g kiik:install
```

This command will create two files: `config/initializers/kiik.rb` and
`config/kiik.yml`, containing the default settings for the app to run.

#### Non-Rails Apps

It is recommended to create a YAML configuration file and a Ruby initializer file. The initializer must be required inside the main application ruby file.

```yaml
# kiik.yml
development:
  api_key:  payos_test
  host:     http://localhost:8800
  version:  '0.3'
staging:
  api_key:  B31DCE74-E768-43ED-86DA-85501612548F
  host:     https://demo.kiik.com
  version:  '0.3'
production:
  api_key:  B31DCE74-E768-43ED-86DA-85501612548F
  host:     https://api.kiik.com
  version:  '0.3'
```

```ruby
# kiik.rb
KIIK_ENV = ENV['KIIK_ENV'] || 'development'
KIIK_CONFIG = YAML.load_file('./kiik.yml')[KIIK_ENV]

Kiik.setup do |config|
  config.host = KIIK_CONFIG['host']
  config.api_key = KIIK_CONFIG['api_key']
  config.version = KIIK_CONFIG['version']
end
```

*Important:* Don't forget to change `api_key` to your key.

### Usage

```ruby
#Create customer
customer = Kiik::Customer.create({name: "User name", email: "user@email.com"})
```

### Production

For production env, don't forget to set `KIIK_ENV` to `production`, that way, our gem will read the `kiik.yml` file correctly.
