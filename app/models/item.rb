class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.order_by_id
    order('id ASC')
  end

  def self.most_revenue(top_num)
    result= self.joins(invoice_items: [invoice: [:transactions]]).where("transactions.result != 'failed'").group("items.id").order("sum_invoice_items_quantity_all_invoice_items_unit_price DESC").limit(top_num).sum("invoice_items.quantity * invoice_items.unit_price")

    items = Item.find(result.keys).map do |item|
      {id: item.id, name: item.name}
    end
  end

  def self.most_items(top_number)
    result = self.joins(invoice_items: [invoice: [:transactions]]).where("transactions.result = 'success'").group("items.id").order("sum_invoice_items_quantity DESC").limit(top_number).sum("invoice_items.quantity")

    items = Item.find(result.keys).map do |item|
      {id: item.id, name: item.name}
    end

  end

  def best_day
    best_day = invoice_items.joins(invoice: [:transactions]).where("transactions.result = 'success'").group("invoices.created_at").order("sum_invoice_items_quantity_all_invoice_items_unit_price DESC").limit(1).sum("invoice_items.quantity * invoice_items.unit_price").keys.first

    {"best_day" => best_day}
  end

end
