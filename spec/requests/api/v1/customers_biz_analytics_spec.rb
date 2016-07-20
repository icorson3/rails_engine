require 'rails_helper'

RSpec.describe "Customers Analytics API", :type => :request do

  it "retrieves the favorite merchant for a customer" do
    customer = create(:customer)

    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)

    invoice_1 = create(:invoice, merchant: merchant_1, customer: customer)
    invoice_2 = create(:invoice, merchant: merchant_1, customer: customer)
    invoice_3 = create(:invoice, merchant: merchant_1, customer: customer)
    invoice_4 = create(:invoice, merchant: merchant_2, customer: customer)
    invoice_5 = create(:invoice, merchant: merchant_2, customer: customer)
    invoice_6 = create(:invoice, merchant: merchant_2, customer: customer)

    transaction_1 = create(:transaction, invoice: invoice_1)
    transaction_2 = create(:transaction, invoice: invoice_2)
    transaction_3 = create(:transaction, invoice: invoice_3, result: "failed")
    transaction_4 = create(:transaction, invoice: invoice_4, result: "failed")
    transaction_5 = create(:transaction, invoice: invoice_5, result: "failed")
    transaction_6 = create(:transaction, invoice: invoice_6, result: "failed")

    get "/api/v1/customers/#{customer.id}/favorite_merchant"

    expect(response).to be_success

    json = JSON.parse(response.body)
    expect(json["id"]).to eq(merchant_1.id)
  end
end
# GET /api/v1/customers/:id/favorite_merchant returns a merchant where the customer has conducted the most successful transactions
