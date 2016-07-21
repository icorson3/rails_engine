class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices

  def self.most_revenue(top_number)
    result = self.joins(invoices: [:invoice_items, :transactions]).where("transactions.result = 'success'").group("merchants.id").order("sum_invoice_items_quantity_all_invoice_items_unit_price DESC").limit(top_number).sum("invoice_items.quantity * invoice_items.unit_price")
    Merchant.find(result.keys)
  end

  def self.most_items(top_number)
    result = self.joins(invoices: [:transactions, :invoice_items]).where("transactions.result = 'success'").group("merchants.id").order("sum_invoice_items_quantity DESC").limit(top_number).sum("invoice_items.quantity")
    Merchant.find(result.keys)
  end

  def revenue
    revenue = (invoices.joins(:transactions, :invoice_items).where("transactions.result != 'failed'").sum("invoice_items.quantity * invoice_items.unit_price")/100.0)
  end

  def revenue_by_date(date)
    revenue = (invoices.where("invoices.created_at = '#{date}'").joins(:transactions, :invoice_items).where("transactions.result != 'failed'").sum("invoice_items.quantity * invoice_items.unit_price")/100.0)
  end

  def favorite_customer
    result = customers.joins(invoices: [:transactions]).where("transactions.result != 'failed'").group("customers.id").order("count_transactions desc").limit(1).count("transactions")
    { "id" => result.keys.first }
  end

  def customers_with_pending_invoices
    customers.joins(:invoices).joins("INNER JOIN transactions on transactions.invoice_id=invoices.id").where("transactions.result='failed'").distinct
  end
end
