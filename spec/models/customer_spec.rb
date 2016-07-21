require 'rails_helper'

RSpec.describe Customer, type: :model do

  scenario "favorite merchant returns merchant" do
    customer = create(:customer)
    invoice = create(:invoice, customer: customer)
    transaction = create(:transaction, invoice: invoice)
    merchant = invoice.merchant

    expect(customer.favorite_merchant.name).to eq(merchant.name)
  end

end
