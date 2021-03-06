class Api::V1::Items::FindController < ApplicationController

  def index
    if params[:unit_price]
      query_price = query_price_to_cents(params[:unit_price])
      item = Item.order_by_id.where(unit_price: query_price)
    else
      item = Item.order_by_id.where(item_params)
    end
    render json: item
  end

  def show
    if params[:unit_price]
      query_price = query_price_to_cents(params[:unit_price])
      item = Item.order_by_id.find_by(unit_price: query_price)
    else
      item = Item.order_by_id.find_by(item_params)
    end
    render json: item
  end

  private

  def item_params
    params.permit(:name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end
end
