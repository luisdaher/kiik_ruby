require File.expand_path('../../test_helper', __FILE__)

module Kiik
  class CustomerTest < Test::Unit::TestCase

    should "raise exception for create empty customer" do
      respond = {error: {type:"invalid_request_error", param:"name", message:"Param name is required"}}
      post({}, respond, 422)
      assert_raise KiikError do
        Kiik::Customer.create
      end
    end

    should "return invalid customer for create! empty customer" do
      respond = {error: {type:"invalid_request_error", param:"name", message:"Param name is required"}}
      post({}, respond, 422)
      customer = Kiik::Customer.create!
      assert !customer.valid?
    end

    should "return a new customer for create" do
      customer_data = {name:"Customer test", email:"customer@email.com", phone: "11223344", document:"11122233345"}
      post(customer_data, customer_data)
      customer = Kiik::Customer.create customer_data
      assert customer.valid?
      assert customer.cards.empty?
    end

    should "return a new customer with card for create with card" do
      card_data = {name:"Card Name", number:"1234567890", month:12, year:17}
      customer_data = {name:"Customer test", email:"customer@email.com", phone: "11223344", document:"11122233345", card:card_data}
      respond = {name:"Customer test", email:"customer@email.com", phone: "11223344", document:"11122233345", cards:[card_data]}
      post(customer_data, respond)
      customer = Kiik::Customer.create customer_data
      assert customer.valid?
      assert customer.cards.first.name == card_data[:name]
    end

    should "return customer for create using instance" do
      customer_data = {name:"Customer test", email:"customer@email.com", phone: "11223344", document:"11122233345"}
      post(customer_data)
      customer = Kiik::Customer.new customer_data
      customer.create
      assert customer.valid?
    end

    should "raise exception for update with customer doesn't exists, code 404" do
      error = {error: {type:"invalid_request_error", message:"Customer doesn't exists"}}
      put(0, {}, error, 422)
      assert_raise KiikError do
        Kiik::Customer.update
      end
    end

    should "return invalid customer for update! empty customer" do
      error = {error: {type:"invalid_request_error", message:"Customer doesn't exists"}}
      put(0, {}, error, 422)
      customer = Kiik::Customer.update!
      assert !customer.valid?
      assert_equal customer.errors.first[:attr], "id"
      assert_equal customer.errors.first[:message], "Customer doesn't exists"
    end

    should "return customer updated" do
      customer_data = {id: 1, name:"New name", email:"customer@email.com", phone: "11223344", document:"11122233345"}
      customer_send = {id: 1, name:"New name"}
      put(customer_data[:id], customer_send, customer_data)
      customer = Kiik::Customer.update! customer_send
      assert_equal customer.name, customer_data[:name]
      assert_equal customer.email, customer_data[:email]
    end
  end
end
