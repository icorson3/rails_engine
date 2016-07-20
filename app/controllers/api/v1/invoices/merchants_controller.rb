class Api::V1::Invoices::MerchantsController < ApplicationController

  def show
    invoice = Invoice.find(params[:invoice_id])
    merchant = invoice.merchant
    render json: merchant
  end
end
