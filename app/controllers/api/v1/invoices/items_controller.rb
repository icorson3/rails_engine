class Api::V1::Invoices::ItemsController < ApplicationController

  def index
    invoice = Invoice.find(params[:invoice_id])
    items = invoice.items
    render json: items
  end
end
