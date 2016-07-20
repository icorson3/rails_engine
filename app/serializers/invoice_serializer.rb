class InvoiceSerializer < ActiveModel::Serializer
  attributes :id, :merchant_id, :status, :customer_id
end
