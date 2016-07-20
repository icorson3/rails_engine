require 'rails_helper'

RSpec.describe "All Merchant Analytics API", :type => :request do

  it 'retrieves top revenue earners' do

    merchant1, merchant2 = create_list(:merchant, 2)

    merch1_invoice = create(:invoice, merchant: merchant1)
    invoice_item1 = create(:invoice_item, invoice: merch1_invoice)
    invoice_item2 = create(:invoice_item, invoice: merch1_invoice)
    transaction = create(:transaction, invoice: merch1_invoice)

    get "/api/v1/merchants/most_revenue?quantity=1"

    expect(response).to be_success

    json = JSON.parse(response.body)
    expect(json.count).to eq(1)

    expect(json.first["#{merchant1.id}"]).to eq("201.00")
  end
end
