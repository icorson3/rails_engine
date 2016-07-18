class Merchant < ApplicationRecord
  default_scope { order('id ASC') }
end
