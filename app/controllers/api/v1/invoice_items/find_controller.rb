class Api::V1::InvoiceItems::FindController < ApplicationController

  def index
    if params[:unit_price]
      query_price = query_price_to_cents(params[:unit_price])
      invoice_item = InvoiceItem.where(unit_price: query_price)
    else
      invoice_item = InvoiceItem.where(invoice_item_params)
    end
    render json: invoice_item
  end

  def show
    if params[:unit_price]
      query_price = query_price_to_cents(params[:unit_price])
      invoice_item = InvoiceItem.find_by(unit_price: query_price)
    else
      invoice_item = InvoiceItem.find_by(invoice_item_params)
    end
    render json: invoice_item
  end

  private

  def invoice_item_params
    params.permit(:id, :invoice_id, :quantity, :unit_price, :item_id, :created_at, :updated_at)
  end
end
