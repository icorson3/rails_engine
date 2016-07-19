class Invoice < ApplicationRecord
  default_scope { order('id ASC') }
end
