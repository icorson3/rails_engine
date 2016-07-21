require 'rails_helper'

RSpec.describe Invoice, type: :model do

  scenario "returns revenue by date" do
    invoice1, invoice2, invoice3 = create_list(:invoice, 3)
    create(:invoice_item, invoice: invoice1)
    create(:invoice_item, invoice: invoice2)
    create(:invoice_item, invoice: invoice3)
    create(:transaction, invoice: invoice1)
    create(:transaction, invoice: invoice2)
    create(:transaction, invoice: invoice3)

    expect(Invoice.total_revenue_on_date("2016-01-01 00:00:00")).to eq(301.50)
  end

end
