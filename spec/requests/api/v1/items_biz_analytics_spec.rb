require 'rails_helper'

RSpec.describe "Item Analytics API", :type => :request do

  it 'retrieves top items by revenue' do
    item1, item2 = create_list(:item, 2)

    item1_invoice = create(:invoice)
    invoice_item1 = create(:invoice_item, invoice: item1_invoice, item: item1)
    invoice_item2 = create(:invoice_item, invoice: item1_invoice, item: item1)
    transaction = create(:transaction, invoice: item1_invoice)

    item2_invoice = create(:invoice)
    invoice_item3 = create(:invoice_item, invoice: item2_invoice, item: item2)
    transaction = create(:transaction, invoice: item2_invoice)

    get "/api/v1/items/most_revenue?quantity=2"

    expect(response).to be_success

    json = JSON.parse(response.body)

    expect(json.count).to eq(2)
    expect(json.first["name"]).to eq(item1.name)
    expect(json.first["id"]).to eq(item1.id)
  end

  it 'retrieves most items for a merchant' do

    item1, item2 = create_list(:item, 2)

    item1_invoice = create(:invoice)
    invoice_item1 = create(:invoice_item, invoice: item1_invoice, item: item1)
    invoice_item2 = create(:invoice_item, invoice: item1_invoice, item: item1)
    transaction = create(:transaction, invoice: item1_invoice)

    item2_invoice = create(:invoice)
    invoice_item3 = create(:invoice_item, invoice: item2_invoice, item: item2)
    transaction = create(:transaction, invoice: item2_invoice)

    get "/api/v1/items/most_items?quantity=1"

    expect(response).to be_success

    json = JSON.parse(response.body)

    expect(json.count).to eq(1)
    expect(json.first["name"]).to eq(item1.name)
    expect(json.first["id"]).to eq(item1.id)
  end

  it 'retrieves best day for an item' do

    item1, item2 = create_list(:item, 2)

    item1_invoice = create(:invoice)
    invoice_item1 = create(:invoice_item, invoice: item1_invoice, item: item1)
    invoice_item2 = create(:invoice_item, invoice: item1_invoice, item: item1)
    transaction = create(:transaction, invoice: item1_invoice)

    item2_invoice = create(:invoice)
    invoice_item3 = create(:invoice_item, invoice: item2_invoice, item: item2)
    transaction = create(:transaction, invoice: item2_invoice)

    get "/api/v1/items/#{item1.id}/best_day"

    expect(response).to be_success

    json = JSON.parse(response.body)

    expect(json["best_day"]).to eq("2016-01-01T00:00:00.000Z")
  end
end
