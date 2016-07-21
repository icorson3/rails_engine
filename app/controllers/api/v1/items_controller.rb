class Api::V1::ItemsController < ApplicationController

  def index
    render json: Item.order_by_id
  end

  def show
    render json: Item.find(params[:id])
  end
end
