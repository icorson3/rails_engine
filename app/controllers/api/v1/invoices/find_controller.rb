class Api::V1::Invoices::FindController < ApplicationController

  def index
    render json: Invoice.where(invoice_params)
  end

  def show
    render json: Invoice.find_by(invoice_params)
  end

  private

  def invoice_params
    params.permit(:id, :merchant_id, :status, :updated_at, :created_at, :customer_id)
  end
end
