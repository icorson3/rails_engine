class Api::V1::Items::InvoiceItemsController < ApplicationController

  def index
    item = Item.find(params[:item_id])
    invoice_items = item.invoice_items
    render json: invoice_items
  end
end
