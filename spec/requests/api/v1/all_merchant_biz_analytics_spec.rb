require 'rails_helper'

RSpec.describe "All Merchant Analytics API", :type => :request do

  xit 'retrieves top revenue earners' do

    merchant1, merchant2 = create_list(:merchant, 2)

    merch1_invoice = create(:invoice, merchant: merchant1)
    invoice_item1 = create(:invoice_item, invoice: merch1_invoice)
    invoice_item2 = create(:invoice_item, invoice: merch1_invoice)
    transaction = create(:transaction, invoice: merch1_invoice)

    merch2_invoice = create(:invoice, merchant: merchant2)
    invoice_item3 = create(:invoice_item, invoice: merch2_invoice)
    transaction = create(:transaction, invoice: merch2_invoice)

    get "/api/v1/merchants/most_revenue?quantity=2"

    expect(response).to be_success

    json = JSON.parse(response.body)
    expect(json.first.count).to eq(1)

    expect(json.first["name"]).to eq(merchant1.name)
    expect(json.first["id"]).to eq(merchant1.id)
    expect(json.first["revenue"]).to eq("201.00")
  end

  it 'retrieves most items for a merchant' do

    merchant1, merchant2 = create_list(:merchant, 2)

    merch1_invoice = create(:invoice, merchant: merchant1)
    invoice_item1 = create(:invoice_item, invoice: merch1_invoice)
    item1 = invoice_item1.item
    invoice_item2 = create(:invoice_item, invoice: merch1_invoice)
    item2 = invoice_item2.item
    transaction = create(:transaction, invoice: merch1_invoice)

    merch2_invoice = create(:invoice, merchant: merchant2)
    invoice_item3 = create(:invoice_item, invoice: merch2_invoice)
    item3 = invoice_item3.item
    transaction = create(:transaction, invoice: merch2_invoice, result: "failed")

    get "/api/v1/merchants/most_items?quantity=2"

    expect(response).to be_success

    json = JSON.parse(response.body)

    expect(json.first.count).to eq(1)

    expect(json.first["name"]).to eq(item1.name)
    expect(json.first["id"]).to eq(item1.id)
  end

    it 'retrieves revenue for a specific date for a merchant' do

      merchant1, merchant2 = create_list(:merchant, 2)

      merch1_invoice = create(:invoice, merchant: merchant1)
      invoice_item1 = create(:invoice_item, invoice: merch1_invoice)
      item1 = invoice_item1.item
      invoice_item2 = create(:invoice_item, invoice: merch1_invoice)
      item2 = invoice_item2.item
      transaction = create(:transaction, invoice: merch1_invoice)

      merch2_invoice = create(:invoice, merchant: merchant2)
      invoice_item3 = create(:invoice_item, invoice: merch2_invoice)
      item3 = invoice_item3.item
      transaction = create(:transaction, invoice: merch2_invoice, result: "failed")

      get "/api/v1/merchants/revenue?date=2016-01-01 00:00:00"

      expect(response).to be_success

      json = JSON.parse(response.body)

      expect(json["total_revenue"]).to eq("201.00")
    end

end
