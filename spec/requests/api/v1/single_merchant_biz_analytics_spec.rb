require 'rails_helper'

RSpec.describe "Single Merchant Analytics API", :type => :request do

  it 'retrieves revenue for a single merchant' do

    merchant = create(:merchant)
    invoice = create(:invoice, merchant: merchant)
    invoice_item1 = create(:invoice_item, invoice: invoice)
    invoice_item2 = create(:invoice_item, invoice: invoice)
    transaction = create(:transaction, invoice: invoice)

    get "/api/v1/merchants/#{merchant.id}/revenue"

    expect(response).to be_success

    json = JSON.parse(response.body)

    expect(json["revenue"]).to eq("201.00")
  end

  it 'retrieves the revenue by date for a single merchant' do
    merchant = create(:merchant)
    invoice = create(:invoice, merchant: merchant, created_at: "2012-03-25 09:54:09")
    invoice_item1 = create(:invoice_item, invoice: invoice)
    invoice_item2 = create(:invoice_item, invoice: invoice)
    transaction = create(:transaction, invoice: invoice)

    get "/api/v1/merchants/#{merchant.id}/revenue?date=#{invoice.created_at}"

    expect(response).to be_success

    json = JSON.parse(response.body)

    expect(json["revenue"]).to eq("201.00")
  end

  it "retrieves the best customer for a merchant" do
    merchant = create(:merchant)
    customer_1= create(:customer)
    customer_2 = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer_1)
    transaction_1 = create(:transaction, invoice: invoice_1)
    transaction_2 = create(:transaction, invoice: invoice_1)
    invoice_2 = create(:invoice, merchant: merchant, customer: customer_2)
    transaction_3 = create(:transaction, invoice: invoice_2)

    get "/api/v1/merchants/#{merchant.id}/favorite_customer"

    expect(response).to be_success

    json = JSON.parse(response.body)
    expect(json["id"]).to eq(customer_1.id)
  end

  it "retrieves the all customers with pending invoices" do
    merchant = create(:merchant)
    customer_1= create(:customer)
    customer_2 = create(:customer)
    customer_3 = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer_1)
    invoice_2 = create(:invoice, merchant: merchant, customer: customer_2)
    invoice_3 = create(:invoice, merchant: merchant, customer: customer_3)
    transaction_1 = create(:transaction, invoice: invoice_1, result: "failed")
    transaction_2 = create(:transaction, invoice: invoice_2, result: "failed")
    transaction_2 = create(:transaction, invoice: invoice_3)

    get "/api/v1/merchants/#{merchant.id}/customers_with_pending_invoices"

    expect(response).to be_success

    json = JSON.parse(response.body)
    expect(json.count).to eq(2)
  end
end
