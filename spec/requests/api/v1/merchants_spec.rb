require 'rails_helper'

RSpec.describe "Merchants API", :type => :request do

  it 'retrieves all merchants' do
    merchant_1, merchant_2, merchant_3 = create_list(:merchant, 3)

    get "/api/v1/merchants"

    expect(response).to be_success

    json = JSON.parse(response.body)

    expect(json.count).to eq(Merchant.count)
  end

  it 'retrieves one merchant' do
    merchant_1, merchant_2, merchant_3 = create_list(:merchant, 3)

    get "/api/v1/merchants/#{merchant_2.id}"
    expect(response).to be_success

    json = JSON.parse(response.body)

    expect(json["name"]).to eq(merchant_2.name)
  end

  it "finds a merchant by name" do
    merchant = create(:merchant)

    get "/api/v1/merchants/find?name=#{merchant.name.upcase}"

    json = JSON.parse(response.body)

    expect(json["name"]).to eq(merchant.name)
  end

  it "finds all merchants by name" do
    merchant_1 = create(:merchant, name: "bob")
    merchant_2 = create(:merchant, name: "bob")
    merchant_3 = create(:merchant, name: "sue")

    get "/api/v1/merchants/find_all?name=#{merchant_1.name.upcase}"

    json = JSON.parse(response.body)

    expect(json.count).to eq(2)
  end
end
