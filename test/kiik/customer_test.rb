require File.expand_path('../../test_helper', __FILE__)
require 'pry'

module Kiik
  class CustomerTest < Test::Unit::TestCase

    should "raise exception for create empty customer" do
      error = {type:"invalid_request_error", param:"name", message:"Param name is required"}
      make_customer({}, error)
      assert_raise KiikError do
        Kiik::Customer.create
      end
    end

    should "return invalid customer for create! empty customer" do
      error = {type:"invalid_request_error", param:"name", message:"Param name is required"}
      make_customer({}, error)
      customer = Kiik::Customer.create!
      assert !customer.valid?
    end

    should "return a new customer for create" do
      data = {name:"Customer test", email:"customer@email.com", phone: "11223344", document:"11122233345"}
      make_customer data
      customer = Kiik::Customer.create data
      assert customer.valid?
      assert customer.cards.empty?
    end

    should "return a new customer with card for create with card" do
      card_data = {name:"Card Name", number:"1234567890", month:12, year:17}
      customer_data = {name:"Customer test", email:"customer@email.com", phone: "11223344", document:"11122233345", card:card_data}
      make_customer customer_data
      customer = Kiik::Customer.create customer_data
      assert customer.valid?
      assert customer.cards[0].name == card_data[:name]
    end

    should "return customer for create using instance" do
      data = {name:"Customer test", email:"customer@email.com", phone: "11223344", document:"11122233345"}
      make_customer data
      customer = Kiik::Customer.new data
      customer.create
      assert customer.valid?
    end
  end
end
