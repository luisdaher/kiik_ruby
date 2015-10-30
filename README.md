# KiiK Ruby [![Codeship Status for kiik-payments/kiik_ruby](https://codeship.com/projects/893b1600-608e-0133-73dd-7258394f756c/status?branch=master)](https://codeship.com/projects/112216)[![Inline docs](http://inch-ci.org/github/kiik-payments/kiik-ruby.svg?branch=master)](http://inch-ci.org/github/kiik-payments/kiik-ruby)

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
Kiik gem use config file `config/kiik.yml` for take api_key
For create this file in your project use task:

```
rake kiik:config
```

Don't forget to change `api_key` to your key

### Use

```ruby
#Create customer
customer = Kiik::Customer.create({name: "User name", email: "user@email.com"})
```

### Production

For production env, don't forget to set `KIIK_ENV` to `production`, that way, our gem will read the `kiik.yml` file corretly.
