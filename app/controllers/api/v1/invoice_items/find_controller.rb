class Api::V1::InvoiceItems::FindController < ApplicationController

  def index
    if params[:unit_price]
      ii = InvoiceItem.determine_price(params[:unit_price])
    else
      ii = InvoiceItem.where(invoice_item_params)
    end
    render json: ii
  end

  def show
    if params[:unit_price]
      ii = InvoiceItem.determine_price(params[:unit_price])
    else
      ii = InvoiceItem.where(invoice_item_params)
    end
    render json: ii
  end

  private

  def invoice_item_params
    params.permit(:invoice_id, :quantity, :unit_price, :item_id, :created_at, :updated_at)
  end
end
