class Changeitemstoreferenceininvoiceitems < ActiveRecord::Migration[5.0]
  def change
    remove_column :invoice_items, :item_id
    add_reference :invoice_items, :item, foreign_key: true
  end
end
