class Merchant < ApplicationRecord
  default_scope { order('id ASC') }
  has_many :invoices
  has_many :items
  
end
