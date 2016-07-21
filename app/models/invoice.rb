class Invoice < ApplicationRecord
  belongs_to :merchant
  belongs_to :customer
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions

  def self.total_revenue_on_date(date)

   result = self.joins(:invoice_items, :transactions).where("transactions.result = 'success'").where("invoices.created_at = '#{date}'").sum("invoice_items.quantity * invoice_items.unit_price")/100.0
   {"total_revenue" => result.to_s}

  end
end
