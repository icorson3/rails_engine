class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  scope :order_by_id, -> { order('id ASC') }

  def self.most_revenue(top_num)
    select("items.*, sum(invoice_items.quantity * invoice_items.unit_price) AS sum_invoice_items_quantity_all_invoice_items_unit_price")
    .joins(invoice_items: [invoice: [:transactions]])
    .where("transactions.result != 'failed'")
    .group("items.id")
    .order("sum_invoice_items_quantity_all_invoice_items_unit_price DESC")
    .limit(top_num)
  end

  def self.most_items(top_number)
    select("items.*, sum(invoice_items.quantity) AS sum_invoice_items_quantity")
    .joins(invoice_items: [invoice: [:transactions]])
    .where("transactions.result = 'success'")
    .group("items.id")
    .order("sum_invoice_items_quantity DESC")
    .limit(top_number)
  end

  def best_day
    invoice_items
    .select("invoices.created_at, sum(invoice_items.quantity * invoice_items.unit_price) AS sum_invoice_items_quantity_all_invoice_items_unit_price")
    .joins(invoice: [:transactions])
    .where("transactions.result = 'success'")
    .group("invoices.created_at")
    .order("sum_invoice_items_quantity_all_invoice_items_unit_price DESC")
    .first
    .created_at
  end
end
