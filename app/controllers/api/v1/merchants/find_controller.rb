class Api::V1::Merchants::FindController < ApplicationController

  def index
    if params["name"]
      table = Merchant.arel_table
      merchant = Merchant.where(table[:name].matches("#{params["name"]}"))
    elsif params["id"]
      merchant = Merchant.find(params[:id])
    elsif params["created_at"]
      merchant = Merchant.where(created_at: params[:created_at])
    elsif params["updated_at"]
      merchant = Merchant.where(updated_at: params[:updated_at])
    end
    render json: merchant
  end

  def show
    if params["name"]
      table = Merchant.arel_table
      merchant = Merchant.find_by(table[:name].matches("#{params["name"]}"))
    elsif params["id"]
      merchant = Merchant.find(params[:id])
    elsif params["created_at"]
      merchant = Merchant.find_by(created_at: params[:created_at])
    elsif params["updated_at"]
      merchant = Merchant.find_by(updated_at: params[:updated_at])
    end
    render json: merchant
  end

end
