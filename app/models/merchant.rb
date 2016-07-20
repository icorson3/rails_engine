class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  def self.most_revenue(top_number)
    self.joins(:invoices, :transactions, :invoice_items).where("transactions.result != 'failed'").group("merchants.id").order("sum_invoice_items_quantity_all_invoice_items_unit_price DESC").limit(top_number).sum("invoice_items.quantity * invoice_items.unit_price")
  end


end
