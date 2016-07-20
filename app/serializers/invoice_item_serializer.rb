class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id, :invoice_id, :quantity, :item_id, :unit_price

  def unit_price
    (object.unit_price.to_f/100).round(2)
  end
end
