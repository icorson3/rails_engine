require 'rails_helper'

RSpec.describe "items Relationships", :type => :request do

  it 'retrieves all invoice items for an item' do
    item = create(:item)
    invoice_item = create(:invoice_item, item: item)
    invoice_item_2 = create(:invoice_item, item: item)

    get "/api/v1/items/#{item.id}/invoice_items"

    expect(response).to be_success

    json = JSON.parse(response.body)

    expect(json.first["item_id"]).to eq(item.id)
  end

  it 'retrieves a merchant for an item' do
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)

    get "/api/v1/items/#{item.id}/merchant"

    expect(response).to be_success

    json = JSON.parse(response.body)

    expect(json["id"]).to eq(item.merchant_id)
  end

end
