class Invoice < ApplicationRecord
  belongs_to :merchant
  #belongs_to :customer #ADD WHEN READY
  default_scope { order('id ASC') }
end
