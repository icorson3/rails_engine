class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices

  def self.most_revenue(top_number)
    result = self.joins(invoices: [:invoice_items, :transactions]).where("transactions.result = 'success'").group("merchants.id").order("sum_invoice_items_quantity_all_invoice_items_unit_price DESC").limit(top_number).sum("invoice_items.quantity * invoice_items.unit_price")

    #THIS NEEDS TO GET FIXED
    # result = result.inject({}) do |hash, (merch_id, rev_in_cents)|
    #   hash["id"] = merch_id
    #   hash["name"] = Merchant.find(merch_id).name
    #   hash["revenue"] = sprintf('%.2f', rev_in_cents/100.0).to_s
    #   hash
    # end
    # result.to_json
  end

  def self.most_items(top_number)
    result = self.joins(invoices: [:transactions, :invoice_items]).where("transactions.result = 'success'").group("merchants.id").order("sum_invoice_items_quantity DESC").limit(top_number).sum("invoice_items.quantity").keys

    hash = {}
    result.each do |item|


    # result = result.map do |item_id|


    # {89=>1653, 12=>1585, 22=>1529, 98=>1507, 74=>1470, 49=>1422, 58=>1407, 84=>1397}

    # result.to_json
    end
  end

  def revenue
    revenue = (invoices.joins(:transactions, :invoice_items).where("transactions.result != 'failed'").sum("invoice_items.quantity * invoice_items.unit_price")/100.0)
    result = {"revenue" => sprintf('%.2f', revenue)}
    result.to_json
  end

  def revenue_by_date(date)
    revenue = (invoices.where("invoices.created_at = '#{date}'").joins(:transactions, :invoice_items).where("transactions.result != 'failed'").sum("invoice_items.quantity * invoice_items.unit_price")/100.0)
    result = {"revenue" => sprintf('%.2f', revenue)}
    result.to_json
  end

  def favorite_customer
    result = customers.joins(invoices: [:transactions]).where("transactions.result != 'failed'").group("customers.id").order("count_transactions desc").limit(1).count("transactions")
    result = { "id" => result.keys.first }
    result.to_json
  end

  def customers_with_pending_invoices
    # customers.joins(invoices: [:transactions]).where("transactions.result = 'failed'")
    # customers.joins(invoices: [:transactions]).where("transactions.result = 'failed'").group("customers.id").count("transactions")
    # joins(invoices: [:customers, :transactions]).where("transactions.result = 'failed'").select("customers.id").distinct
  end
end
