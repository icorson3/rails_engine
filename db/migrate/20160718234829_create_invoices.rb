class CreateInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :invoices do |t|
      t.integer :customer_id
      t.references :merchant, index: true, foreign_key: true
      t.string :status
      t.datetime :updated_at
      t.datetime :created_at
    end
  end
end
