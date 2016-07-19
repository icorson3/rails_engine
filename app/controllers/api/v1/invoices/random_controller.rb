class Api::V1::Invoices::RandomController < ApplicationController

  def show
    offset = rand(Invoice.count)
    random_record = Invoice.offset(offset).first
    render json: random_record
  end
end
