require 'rails_helper'

RSpec.describe "Customer Relationships", :type => :request do

  it 'retrieves all invoices for a customer' do
    customer, other_customer = create_list(:customer, 2)
    invoice = create(:invoice, customer: customer)
    other_invoice = create(:invoice, customer: other_customer)

    get "/api/v1/customers/#{customer.id}/invoices"

    expect(response).to be_success

    json = JSON.parse(response.body)

    expect(json.count).to eq(1)
    expect(json.first["id"]).to eq(invoice.id)
  end

  it 'retrieves all transactions for a customer' do
    customer, other_customer = create_list(:customer, 2)
    invoice = create(:invoice, customer: customer)
    other_invoice = create(:invoice, customer: other_customer)
    transaction = create(:transaction, invoice: invoice)
    other_transaction = create(:transaction, invoice: other_invoice)

    get "/api/v1/customers/#{customer.id}/transactions"

    expect(response).to be_success

    json = JSON.parse(response.body)

    expect(json.count).to eq(1)
    expect(json.first["id"]).to eq(transaction.id)
    expect(json.first["credit_card_number"]).to eq(transaction.credit_card_number)
  end


end
