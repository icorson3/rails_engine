class Api::V1::InvoiceItems::RandomController < ApplicationController

  def show
    offset = rand(InvoiceItem.count)
    random_record = InvoiceItem.offset(offset).first
    render json: random_record
  end
end
