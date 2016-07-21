class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def favorite_merchant
    result = merchants.joins(invoices: [:transactions]).where("transactions.result != 'failed'").group("merchants.id").order("count_transactions desc").limit(1).count("transactions")
    result = { "id" => result.keys.first, "name" => Merchant.find(result.keys.first).name }
  end
end
