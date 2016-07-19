class Customer < ApplicationRecord
  default_scope { order('id ASC') }
end
