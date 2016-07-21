class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.order_by_id
    order('id ASC')
  end


  def self.most_revenue(top_num)
    self.joins(invoice_items: [invoice: [:transactions]]).where("transactions.result != 'failed'").group("items.id").order("sum_invoice_items_quantity_all_invoice_items_unit_price DESC").limit(top_num).sum("invoice_items.quantity * invoice_items.unit_price")

  end


  def self.most_items(top_number)
    self.joins(invoice_items: [invoice: [:transactions]]).where("transactions.result = 'success'").group("items.id").order("sum_invoice_items_quantity DESC").limit(top_number).sum("invoice_items.quantity")

    # result.to_json
  end


  def best_day
    #haven;t handled ties
    #havent handled date format.
    #spec has  2012-03-23T10:55:29.000Z vs
    # 2012-03-20 23:57:05 UTC
    invoice_items.joins(invoice: [:transactions]).where("transactions.result = 'success'").group("invoices.created_at").order("sum_invoice_items_quantity_all_invoice_items_unit_price DESC").limit(1).sum("invoice_items.quantity * invoice_items.unit_price")
  end




end
