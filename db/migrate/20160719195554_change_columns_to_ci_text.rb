class ChangeColumnsToCiText < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'citext'

    change_column :customers, :first_name, :citext
    change_column :customers, :last_name, :citext
    change_column :invoice_items, :unit_price, 'integer USING CAST(unit_price AS integer)'
    change_column :invoices, :status, :citext
    change_column :items, :name, :citext
    change_column :items, :description, :citext
    change_column :items, :unit_price, 'integer USING CAST(unit_price AS integer)'
    change_column :merchants, :name, :citext
    change_column :transactions, :credit_card_number, :citext
    change_column :transactions, :result, :citext

  end
end
