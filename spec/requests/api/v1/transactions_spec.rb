require 'rails_helper'

RSpec.describe "Transactions API", :type => :request do

  it 'retrieves all transactions' do
    transaction_1, transaction_2, transaction_3 = create_list(:transaction, 3)

    get "/api/v1/transactions"

    expect(response).to be_success

    json = JSON.parse(response.body)

    expect(json.count).to eq(Transaction.count)
  end

  it 'retrieves one transaction' do
    transaction_1, transaction_2, transaction_3 = create_list(:transaction, 3)

    get "/api/v1/transactions/#{transaction_2.id}"
    expect(response).to be_success

    json = JSON.parse(response.body)

    expect(json["credit_card_number"]).to eq(transaction_2.credit_card_number)
    expect(json["result"]).to eq(transaction_2.result)
  end

  it "finds a transaction by id" do
    transaction = create(:transaction)

    get "/api/v1/transactions/find?id=#{transaction.id}"

    json = JSON.parse(response.body)

    expect(json["id"]).to eq(transaction.id)
  end

  it "finds a transaction by credit_card_number" do
    transaction = create(:transaction)

    get "/api/v1/transactions/find?credit_card_number=#{transaction.credit_card_number.upcase}"

    json = JSON.parse(response.body)

    expect(json["credit_card_number"]).to eq(transaction.credit_card_number)
  end

  it "finds a transaction by result" do
    transaction = create(:transaction)

    get "/api/v1/transactions/find?result=#{transaction.result.upcase}"

    json = JSON.parse(response.body)

    expect(json["result"]).to eq(transaction.result)
  end

  it "finds all transactions by credit_card_number" do
    transaction_1 = create(:transaction, credit_card_number: "bob")
    transaction_2 = create(:transaction, credit_card_number: "bob")
    transaction_3 = create(:transaction)

    get "/api/v1/transactions/find_all?credit_card_number=#{transaction_1.credit_card_number.upcase}"

    json = JSON.parse(response.body)

    expect(json.count).to eq(2)
  end

  it "finds all transactions by result" do
    transaction_1 = create(:transaction)
    transaction_2 = create(:transaction, result: "bob")
    transaction_3 = create(:transaction)

    get "/api/v1/transactions/find_all?result=#{transaction_1.result.upcase}"

    json = JSON.parse(response.body)

    expect(json.count).to eq(2)
  end
end
