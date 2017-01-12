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
From the terminal, run the following command:
```shellscript
rails g kiik:install
```
A configuration file will be created inside `config/initializers` folder.
Change the `environment`, `version` and `api_key`  accordingly.

*Pro tip:* A good and safe way to assign variables in development environments is by using [dotenv](https://github.com/bkeepers/dotenv).

### Usage

```ruby
#Create customer
customer = Kiik::Customer.create({name: "User name", email: "user@email.com"})
```
