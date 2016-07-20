require 'rails_helper'

RSpec.describe "Items API", :type => :request do

  it 'retrieves all items' do
    item1, item2, item3 = create_list(:item, 3)

    get "/api/v1/items"

    expect(response).to be_success

    json = JSON.parse(response.body)
    expect(json.first["id"]).to eq(item1.id)
    expect(json.first["merchant_id"]).to eq(item1.merchant_id)
    expect(json.first["unit_price"]).to eq("10.05")
    expect(json.first["created_at"]).to eq(nil)
    expect(json.first["updated_at"]).to eq(nil)

    expect(json.count).to eq(Item.count)
  end

  it 'retrieves one invoice' do
    item1, item2, item3 = create_list(:item, 3)

    get "/api/v1/items/#{item2.id}"
    expect(response).to be_success

    json = JSON.parse(response.body)

    expect(json["id"]).to eq(item2.id)
    expect(json["merchant_id"]).to eq(item2.merchant_id)
    expect(json["unit_price"]).to eq("10.05")
    expect(json["created_at"]).to eq(nil)
    expect(json["updated_at"]).to eq(nil)
  end

  it "finds an item by merchant id" do
    item = create(:item)

    get "/api/v1/items/find?invoice_id=#{item.merchant_id}"

    json = JSON.parse(response.body)

    expect(json["id"]).to eq(item.id)
  end

  it "finds an invoice item by created at" do
    item = create(:item)

    get "/api/v1/items/find?created_at=#{item.created_at}"

    json = JSON.parse(response.body)

    expect(json["id"]).to eq(item.id)
  end

  it "finds an item by unit price" do
    item = create(:item)
    unit_price_search = ((item.unit_price.to_f)/100.round(2)).to_s

    get "/api/v1/items/find?unit_price=#{unit_price_search}"

    json = JSON.parse(response.body)

    expect(json["id"]).to eq(item.id)
  end

  it "finds all items by merchant id" do
    merchant, other_merchant = create_list(:merchant, 2)
    item1 = create(:item, merchant: merchant)
    item2 = create(:item, merchant: merchant)
    item3 = create(:item, merchant: other_merchant)

    get "/api/v1/items/find_all?merchant_id=#{merchant.id}"

    json = JSON.parse(response.body)

    expect(json.count).to eq(2)
  end
end
