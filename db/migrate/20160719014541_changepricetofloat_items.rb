class ChangepricetofloatItems < ActiveRecord::Migration[5.0]
  def change
    change_column :items, :unit_price, :float
  end
end
