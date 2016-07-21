require 'rails_helper'

RSpec.describe Item, type: :model do

  scenario "returns item with most revenue" do
    item1, item2, item3 = create_list(:item, 3)
    invoice1, invoice2, invoice3 = create_list(:invoice, 3)
    create(:invoice_item, invoice: invoice1, item: item3)
    create(:invoice_item, invoice: invoice2, item: item3)
    create(:invoice_item, invoice: invoice3, item: item3)
    create(:transaction, invoice: invoice1)
    create(:transaction, invoice: invoice2)
    create(:transaction, invoice: invoice3)

    expect(Item.most_revenue(1).first).to eq(item3)
  end

end
