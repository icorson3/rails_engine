class Api::V1::Items::FindController < ApplicationController

  def index
    if params["name"]
      table = Item.arel_table
      item = Item.where(table[:name].matches("#{params["name"]}"))
    elsif params["description"]
      table = Item.arel_table
      item = Item.where(table[:description].matches("#{params["description"]}"))
    elsif params["id"]
      item = Item.where(id: params[:id])
    elsif params["unit_price"]
      item = Item.where(unit_price: params[:unit_price])
    elsif params["merchant_id"]
      item = Item.where(merchant_id: params[:merchant_id])
    elsif params["created_at"]
      item = Item.where(created_at: params[:created_at])
    elsif params["updated_at"]
      item = Item.where(updated_at: params[:updated_at])
    end
    render json: item
  end

  def show
    if params["name"]
      table = Item.arel_table
      item = Item.find_by(table[:name].matches("#{params["name"]}"))
    elsif params["description"]
      table = Item.arel_table
      item = Item.find_by(table[:description].matches("#{params["description"]}"))
    elsif params["id"]
      item = Item.find_by(id: params[:id])
    elsif params["unit_price"]
      item = Item.find_by(unit_price: params[:unit_price])
    elsif params["merchant_id"]
      item = Item.find_by(merchant_id: params[:merchant_id])
    elsif params["created_at"]
      item = Item.find_by(created_at: params[:created_at])
    elsif params["updated_at"]
      item = Item.find_by(updated_at: params[:updated_at])
    end
    render json: item
  end

end
