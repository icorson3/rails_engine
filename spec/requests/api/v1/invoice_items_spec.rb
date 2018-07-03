require 'rails_helper'

RSpec.describe "InvoiceItems API", :type => :request do

  it 'retrieves all invoice items' do
    invoice_item1, invoice_item2, invoice_item3 = create_list(:invoice_item, 3)

    get "/api/v1/invoice_items"

    expect(response).to be_success

    json = JSON.parse(response.body)
    expect(json.first["id"]).to eq(invoice_item1.id)
    expect(json.first["item_id"]).to eq(invoice_item1.item_id)
    expect(json.first["invoice_id"]).to eq(invoice_item1.invoice_id)
    expect(json.first["quantity"]).to eq(invoice_item1.quantity)
    expect(json.first["unit_price"]).to eq("10.05")
    expect(json.first["created_at"]).to eq(nil)
    expect(json.first["updated_at"]).to eq(nil)

    expect(json.count).to eq(InvoiceItem.count)
  end

  it 'retrieves one invoice' do
    invoice_item1, invoice_item2, invoice_item3 = create_list(:invoice_item, 3)

    get "/api/v1/invoice_items/#{invoice_item2.id}"
    expect(response).to be_success

    json = JSON.parse(response.body)

    expect(json["id"]).to eq(invoice_item2.id)
    expect(json["item_id"]).to eq(invoice_item2.item_id)
    expect(json["invoice_id"]).to eq(invoice_item2.invoice_id)
    expect(json["quantity"]).to eq(invoice_item2.quantity)
    expect(json["unit_price"]).to eq("10.05")
    expect(json["created_at"]).to eq(nil)
    expect(json["updated_at"]).to eq(nil)
  end

  it "finds an invoice item by invoice id" do
    invoice_item1, invoice_item2, invoice_item3 = create_list(:invoice_item, 3)

    get "/api/v1/invoice_items/find?invoice_id=#{invoice_item3.invoice_id}"

    json = JSON.parse(response.body)
    expect(json.first["id"]).to eq(invoice_item3.id)
  end

  it "finds an invoice item by created at" do
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/find?created_at=#{invoice_item.created_at}"

    json = JSON.parse(response.body)

    expect(json.first["id"]).to eq(invoice_item.id)
  end

  it "finds an invoice_item by unit price" do
    invoice_item = create(:invoice_item)
    unit_price_search = ((invoice_item.unit_price.to_f)/100.round(2)).to_s

    get "/api/v1/invoice_items/find?unit_price=#{unit_price_search}"

    json = JSON.parse(response.body)

    expect(json.first["id"]).to eq(invoice_item.id)
  end

  it "finds all invoice_items by invoice id" do
    invoice, other_invoice = create_list(:invoice, 2)
    invoice_item1 = create(:invoice_item, invoice: invoice)
    invoice_item2 = create(:invoice_item, invoice: invoice)
    invoice_item3 = create(:invoice_item, invoice: other_invoice)

    get "/api/v1/invoice_items/find_all?invoice_id=#{invoice.id}"

    json = JSON.parse(response.body)

    expect(json.count).to eq(2)
  end
end
