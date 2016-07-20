class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  def self.most_revenue(top_number)
    result = self.joins(invoices: [:invoice_items, :transactions]).where("transactions.result = 'success'").group("merchants.id").order("sum_invoice_items_quantity_all_invoice_items_unit_price DESC").limit(top_number).sum("invoice_items.quantity * invoice_items.unit_price")

    result = result.map do |merch_id, rev_in_cents|
      result[merch_id] = sprintf('%.2f', rev_in_cents/100.0).to_s
      result
    end

    result.to_json
  end

  def revenue
    revenue = (invoices.joins(:transactions, :invoice_items).where("transactions.result != 'failed'").sum("invoice_items.quantity * invoice_items.unit_price")/100.0)

    result = {"revenue" => sprintf('%.2f', revenue)}

    result.to_json
  end

  def favorite_customer
    returns the customer who has conducted the most total number of successful transactions

  end




end
