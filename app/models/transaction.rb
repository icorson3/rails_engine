class Transaction < ApplicationRecord
  default_scope { order('id ASC') }
end
