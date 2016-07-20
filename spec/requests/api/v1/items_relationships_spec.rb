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
  #
  # it 'retrieves a item for an invoice item' do
  #   item = create(:item)
  #   invoice_item = create(:invoice_item, item: item)
  #
  #   get "/api/v1/invoice_items/#{invoice_item.id}/item"
  #
  #   expect(response).to be_success
  #
  #   json = JSON.parse(response.body)
  #   expect(json["id"]).to eq(invoice_item.item_id)
  # end

end
