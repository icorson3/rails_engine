# require 'rails_helper'
#
# RSpec.describe "Customer Relationships", :type => :request do
#
#   it 'retrieves all invoices for a merchant' do
#     customer = create(:customer)
#     invoice = create(:item, merchant: merchant)
#
#     other_merchant = create(:merchant)
#     other_item = create(:item, merchant: other_merchant)
#
#     get "api/v1/customers/#{customer.id}/invoices"
#
#     expect(response).to be_success
#
#     json = JSON.parse(response.body)
#
#     expect(json.count).to eq(1)
#     expect(json.first["name"]).to eq(item.name)
#   end
#
#   it 'retrieves all invoices for a merchant' do
#     merchant = create(:merchant)
#     invoice = create(:invoice, merchant: merchant)
#
#     other_merchant = create(:merchant)
#     other_invoice = create(:invoice, merchant: other_merchant)
#
#     get "/api/v1/merchants/#{merchant.id}/invoices"
#
#     expect(response).to be_success
#
#     json = JSON.parse(response.body)
#
#     expect(json.count).to eq(1)
#     expect(json.first["merchant_id"]).to eq(merchant.id)
#   end
#
#
# end
