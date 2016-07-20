class Changeunitpricetoint < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :unit_price
    remove_column :invoice_items, :unit_price
    add_column :items, :unit_price, :integer
    add_column :invoice_items, :unit_price, :integer

  end
end
