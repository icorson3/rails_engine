require 'rails_helper'

RSpec.describe "Invoice items Relationships", :type => :request do

  it 'retrieves a invoice for an invoice item' do
    invoice = create(:invoice)
    invoice_item = create(:invoice_item, invoice: invoice)

    other_invoice = create(:invoice)
    other_invoice_item = create(:invoice_item, invoice: other_invoice)

    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

    expect(response).to be_success

    json = JSON.parse(response.body)
    expect(json["id"]).to eq(invoice_item.invoice_id)
  end

  it 'retrieves a item for an invoice item' do
    item = create(:item)
    invoice_item = create(:invoice_item, item: item)

    get "/api/v1/invoice_items/#{invoice_item.id}/item"

    expect(response).to be_success

    json = JSON.parse(response.body)
    expect(json["id"]).to eq(invoice_item.item_id)
  end
end
