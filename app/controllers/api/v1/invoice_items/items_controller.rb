class Api::V1::InvoiceItems::ItemsController < ApplicationController

  def show
    invoice_item = InvoiceItem.find(params[:invoice_item_id])

    item = invoice_item.item
    render json: item
  end
end
