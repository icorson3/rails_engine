class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  before_create :unit_price_to_dollars

    def unit_price_to_dollars
      self.unit_price = ((unit_price.to_i.to_f)/100).round(2)
    end
end
