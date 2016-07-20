require 'rails_helper'

RSpec.describe "Invoices Relationships", :type => :request do

  it 'retrieves all transactions for a invoice' do
    invoice = create(:invoice)
    transaction_1 = create(:transaction, invoice: invoice)
    transaction_2 = create(:transaction, invoice: invoice)

    get "/api/v1/invoices/#{invoice.id}/transactions"

    expect(response).to be_success

    json = JSON.parse(response.body)

    expect(json.first["id"]).to eq(transaction_1.id)
  end

  it 'retrieves all invoice_items for a invoice' do
    invoice = create(:invoice)
    invoice_item = create(:invoice_item, invoice: invoice)
    invoice_item_2 = create(:invoice_item, invoice: invoice)

    get "/api/v1/invoices/#{invoice.id}/invoice_items"

    expect(response).to be_success

    json = JSON.parse(response.body)
    expect(json.count).to eq(2)
    expect(json.first["id"]).to eq(invoice_item.id)
  end

  it 'retrieves all items for a invoice' do
    invoice = create(:invoice)
    item = create(:item)
    item_1 = create(:item)
    invoice_item = create(:invoice_item, invoice: invoice, item:item)
    invoice_item_2 = create(:invoice_item, invoice: invoice, item:item_1)

    get "/api/v1/invoices/#{invoice.id}/items"

    expect(response).to be_success

    json = JSON.parse(response.body)
    expect(json.count).to eq(2)
    expect(json.first["id"]).to eq(item.id)
  end

  it "retrieves the merchant for a given invoice" do
    merchant = create(:merchant)
    invoice = create(:invoice, merchant: merchant)

    get "/api/v1/invoices/#{invoice.id}/merchant"

    expect(response).to be_success

    json = JSON.parse(response.body)

    expect(json["id"]).to eq(merchant.id)
  end

  it "retrieves the customer for a given invoice" do
    customer = create(:customer)
    invoice = create(:invoice, customer: customer)

    get "/api/v1/invoices/#{invoice.id}/customer"

    expect(response).to be_success

    json = JSON.parse(response.body)

    expect(json["id"]).to eq(customer.id)
  end
end
