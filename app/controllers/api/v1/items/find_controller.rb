class Api::V1::Items::FindController < ApplicationController

  def index
    if params[:id]
      item = Item.where(id: params[:id])
    else
      item = Item.where(item_params)
    end
    render json: item
  end

  def show
    if params[:id]
      item = Item.find(params[:id])
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
