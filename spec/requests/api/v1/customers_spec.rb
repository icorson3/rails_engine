require 'rails_helper'

RSpec.describe "Customers API", :type => :request do

  it 'retrieves all customers' do
    customer_1, customer_2, customer_3 = create_list(:customer, 3)

    get "/api/v1/customers"

    expect(response).to be_success

    json = JSON.parse(response.body)

    expect(json.count).to eq(Customer.count)
  end

  it 'retrieves one customer' do
    customer_1, customer_2, customer_3 = create_list(:customer, 3)

    get "/api/v1/customers/#{customer_2.id}"
    expect(response).to be_success

    json = JSON.parse(response.body)

    expect(json["first_name"]).to eq(customer_2.first_name)
    expect(json["last_name"]).to eq(customer_2.last_name)
  end

  it "finds a customer by id" do
    customer = create(:customer)

    get "/api/v1/customers/find?id=#{customer.id}"

    json = JSON.parse(response.body)

    expect(json["id"]).to eq(customer.id)
  end

  it "finds a customer by first name" do
    customer = create(:customer)

    get "/api/v1/customers/find?first_name=#{customer.first_name.upcase}"

    json = JSON.parse(response.body)

    expect(json["first_name"]).to eq(customer.first_name)
  end

  it "finds a customer by last name" do
    customer = create(:customer)

    get "/api/v1/customers/find?last_name=#{customer.last_name.upcase}"

    json = JSON.parse(response.body)

    expect(json["last_name"]).to eq(customer.last_name)
  end

  it "finds all customers by first name" do
    customer_1 = create(:customer, first_name: "bob")
    customer_2 = create(:customer, first_name: "bob")
    customer_3 = create(:customer)

    get "/api/v1/customers/find_all?first_name=#{customer_1.first_name.upcase}"

    json = JSON.parse(response.body)

    expect(json.count).to eq(2)
  end

  it "finds all customers by last name" do
    customer_1 = create(:customer, last_name: "bob")
    customer_2 = create(:customer, last_name: "bob")
    customer_3 = create(:customer)

    get "/api/v1/customers/find_all?last_name=#{customer_1.last_name.upcase}"

    json = JSON.parse(response.body)

    expect(json.count).to eq(2)
  end
end
