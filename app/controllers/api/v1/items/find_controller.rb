class Api::V1::Items::FindController < ApplicationController

  def index
    if params["name"]
      table = Item.arel_table
      item = Item.where(table[:name].matches("#{params["name"]}"))
    elsif params["description"]
      table = Item.arel_table
      item = Item.where(table[:description].matches("#{params["description"]}"))
    else
      item = Item.where(item_params)
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
    else
      item = Item.find_by(item_params)
    end
    render json: item
  end


  private

  def item_params
    params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end

end
