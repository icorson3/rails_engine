class Api::V1::Invoices::FindController < ApplicationController

  def index
    if params["status"]
      table = Invoice.arel_table
      merchant = Invoice.where(table[:status].matches("#{params["status"]}"))
    elsif params["id"]
      merchant = Invoice.where(id: params[:id])
    elsif params["customer_id"]
      merchant = Invoice.where(customer_id: params[:customer_id])
    elsif params["merchant_id"]
      merchant = Invoice.where(merchant_id: params[:merchant_id])
    elsif params["created_at"]
      merchant = Invoice.where(created_at: params[:created_at])
    elsif params["updated_at"]
      merchant = Invoice.where(updated_at: params[:updated_at])
    end
    render json: merchant
  end

  def show
    if params["status"]
      table = Invoice.arel_table
      merchant = Invoice.find_by(table[:status].matches("#{params["status"]}"))
    elsif params["id"]
      merchant = Invoice.find_by(id: params[:id])
    elsif params["customer_id"]
      merchant = Invoice.find_by(customer_id: params[:customer_id])
    elsif params["merchant_id"]
      merchant = Invoice.find_by(merchant_id: params[:merchant_id])
    elsif params["created_at"]
      merchant = Invoice.find_by(created_at: params[:created_at])
    elsif params["updated_at"]
      merchant = Invoice.find_by(updated_at: params[:updated_at])
    end
    render json: merchant
  end

end
