class Transaction < ApplicationRecord
  belongs_to :invoice
  default_scope { order("transactions.id ASC") }
end
