class Api::V1::Invoices::CustomersController < ApplicationController

  def show
    invoice = Invoice.find(params[:invoice_id])
    customer = invoice.customer
    render json: customer
  end
end
