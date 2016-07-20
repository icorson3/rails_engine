require 'rails_helper'

RSpec.describe "Invoices API", :type => :request do

  it 'retrieves all invoices' do
    invoice1, invoice2, invoice3 = create_list(:invoice, 3)

    get "/api/v1/invoices"

    expect(response).to be_success

    json = JSON.parse(response.body)
    expect(json.first["id"]).to eq(invoice1.id)
    expect(json.first["status"]).to eq(invoice1.status)
    expect(json.first["customer_id"]).to eq(invoice1.customer_id)
    expect(json.first["created_at"]).to eq(nil)
    expect(json.first["updated_at"]).to eq(nil)

    expect(json.count).to eq(Invoice.count)
  end

  it 'retrieves one invoice' do
    invoice_1, invoice_2, invoice_3 = create_list(:invoice, 3)

    get "/api/v1/invoices/#{invoice_2.id}"
    expect(response).to be_success

    json = JSON.parse(response.body)

    expect(json["id"]).to eq(invoice_2.id)
    expect(json["status"]).to eq(invoice_2.status)
    expect(json["customer_id"]).to eq(invoice_2.customer_id)
    expect(json["created_at"]).to eq(nil)
    expect(json["updated_at"]).to eq(nil)
  end

  it "finds an invoice by merchant id" do
    invoice1, invoice2, invoice3 = create_list(:invoice, 3)

    get "/api/v1/invoices/find?merchant_id=#{invoice3.merchant_id}"

    json = JSON.parse(response.body)

    expect(json["id"]).to eq(invoice3.id)
  end

  it "finds an invoice by created at" do
    invoice = create(:invoice)

    get "/api/v1/invoices/find?created_at=#{invoice.created_at}"

    json = JSON.parse(response.body)

    expect(json["id"]).to eq(invoice.id)
  end

  it "finds an invoice by updated at" do
    invoice = create(:invoice)

    get "/api/v1/invoices/find?updated_at=#{invoice.created_at}"

    json = JSON.parse(response.body)

    expect(json["id"]).to eq(invoice.id)
  end

  it "finds an invoice by status" do
    invoice = create(:invoice)

    get "/api/v1/invoices/find?status=#{invoice.status.upcase}"

    json = JSON.parse(response.body)

    expect(json["id"]).to eq(invoice.id)
  end

  it "finds all merchants by merchant id" do
    merchant, other_merchant = create_list(:merchant, 2)
    invoice1 = create(:invoice, merchant: merchant)
    invoice2 = create(:invoice, merchant: merchant)
    invoice3 = create(:invoice, merchant: other_merchant)

    get "/api/v1/invoices/find_all?merchant_id=#{merchant.id}"

    json = JSON.parse(response.body)

    expect(json.count).to eq(2)
  end
end
