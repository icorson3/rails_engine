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
end
