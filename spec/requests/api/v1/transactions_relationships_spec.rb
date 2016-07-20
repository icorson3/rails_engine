require 'rails_helper'

RSpec.describe "Transaction Relationships", :type => :request do

  it 'retrieves a invoice for a transaction' do
    invoice, other_invoice = create_list(:invoice, 2)
    transaction = create(:transaction, invoice: invoice)
    other_transaction = create(:transaction, invoice: other_invoice)

    get "/api/v1/transactions/#{transaction.id}/invoice"

    expect(response).to be_success

    json = JSON.parse(response.body)
    expect(json["id"]).to eq(transaction.invoice_id)
  end


end
