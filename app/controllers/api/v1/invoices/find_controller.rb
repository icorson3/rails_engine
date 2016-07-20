class Api::V1::Invoices::FindController < ApplicationController

  def index
    invoice = Invoice.where(invoice_params)
    render json: invoice
  end

  def show
    invoice = Invoice.find_by(invoice_params)
    render json: invoice
  end

  private

  def invoice_params
    params.permit(:id, :merchant_id, :status, :updated_at, :created_at, :customer_id)
  end

end
