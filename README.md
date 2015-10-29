# KiiK Ruby [![Inline docs](http://inch-ci.org/github/kiik-payments/kiik-ruby.svg?branch=master)](http://inch-ci.org/github/kiik-payments/kiik-ruby)
Gem for bindings with Kiik API

Requirements
--------------
* ruby    >= 2.2.3
* httpaty >= 0.13.7

Installation
--------------
### Gem ###
   `gem install kiik`

### Bundle ###
    source 'https://rubygems.org'
    gem 'kiik'

Tasks
-----
### Configuration ###
Kiik gem use config file `config/kiik.yml` for take api_key
For create this file in your project use task:

`rake kiik:config`

Don't forget to change `api_key` to your key

### Use ###

```ruby
#Create customer
customer = Kiik::Customer.create({name: "User name", email: "user@email.com"})
```

### Production

For production env, don't forget to set `KIIK_ENV` to `production`, that way, our gem will read the `kiik.yml` file corretly.

