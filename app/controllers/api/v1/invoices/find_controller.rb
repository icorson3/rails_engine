class Api::V1::Invoices::FindController < ApplicationController

  def index
    if params[:id]
      invoice = Invoice.where(id: params[:id])
    else
      invoice = Invoice.where(invoice_params)
    end
    render json: invoice
  end

  def show
    if params[:id]
      invoice = Invoice.find(params[:id])
    else
      invoice = Invoice.find_by(invoice_params)
    end
    render json: invoice
  end

  private

  def invoice_params
    params.permit(:merchant_id, :status, :updated_at, :created_at, :customer_id)
  end

end
