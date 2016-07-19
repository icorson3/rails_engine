class Api::V1::InvoiceItems::FindController < ApplicationController

  def index
    if params["id"]
      invoice_item = InvoiceItem.where(id: params[:id])
    elsif params["invoice_id"]
      invoice_item = InvoiceItem.where(invoice_id: params[:invoice_id])
    elsif params["item_id"]
      invoice_item = InvoiceItem.where(item_id: params[:item_id])
    elsif params["quantity"]
      invoice_item = InvoiceItem.where(quantity: params[:quantity])
    elsif params["unit_price"]
      invoice_item = InvoiceItem.where(unit_price: params[:unit_price])
    elsif params["created_at"]
      invoice_item = InvoiceItem.where(created_at: params[:created_at])
    elsif params["updated_at"]
      invoice_item = InvoiceItem.where(updated_at: params[:updated_at])
    end
    render json: invoice_item
  end

  def show
    if params["id"]
      invoice_item = InvoiceItem.find_by(id: params[:id])
    elsif params["invoice_id"]
      invoice_item = InvoiceItem.find_by(invoice_id: params[:invoice_id])
    elsif params["item_id"]
      invoice_item = InvoiceItem.find_by(item_id: params[:item_id])
    elsif params["quantity"]
      invoice_item = InvoiceItem.find_by(quantity: params[:quantity])
    elsif params["unit_price"]
      invoice_item = InvoiceItem.find_by(unit_price: params[:unit_price])
    elsif params["created_at"]
      invoice_item = InvoiceItem.find_by(created_at: params[:created_at])
    elsif params["updated_at"]
      invoice_item = InvoiceItem.find_by(updated_at: params[:updated_at])
    end
    render json: invoice_item
  end


end
