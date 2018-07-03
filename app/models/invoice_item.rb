class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :item

  def self.determine_price(price)
    where(unit_price: query_price_to_cents(price))
  end

  private

  def self.query_price_to_cents(query_price)
    (query_price.to_f*100).round
  end
end
