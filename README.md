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

### Configuration
Kiik gem uses environment variables. They are:

- `KIIK_ENV`: the chosen environment. Valid values are `production`, `staging` and `development`
- `KIIK_VERSION`: the chosen API version. Default value is `0.3`.
- `KIIK_KEY`: the API key. A valid value for testing on `development` is `B31DCE74-E768-43ED-86DA-85501612548F`

A good and safe way to assign those variables in development environments is by using [dotenv](https://github.com/bkeepers/dotenv).

### Usage

```ruby
#Create customer
customer = Kiik::Customer.create({name: "User name", email: "user@email.com"})
```
