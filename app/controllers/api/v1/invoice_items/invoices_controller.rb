class Api::V1::InvoiceItems::InvoicesController < ApplicationController

  def show
    invoice_item = InvoiceItem.find(params[:invoice_item_id])

    invoice = invoice_item.invoice
    render json: invoice
  end
end
