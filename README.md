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
Kiik gem use config file `config/kiik.yml` in order to take api_key
To create this file in your project use:

```
rails g kiik:config
```

Don't forget to replace `api_key` with your key

### Usage

```ruby
#Create customer
customer = Kiik::Customer.create({name: "User name", email: "user@email.com"})
```

### Production

For production env, don't forget to set `KIIK_ENV` to `production`, that way, our gem will read the `kiik.yml` file corretly.
