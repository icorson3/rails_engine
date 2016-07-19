class Api::V1::ItemsController < ApplicationController

  before_action :load_merchant, only: [:index]

  def load_merchant
    @merchant = Merchant.find(params[:merchant_id]) if params[:merchant_id]
    @items = @merchant ? @merchant.items : Item.all
  end

  def index
    render json: @items
  end

  def show
    render json: Item.find(params[:id])
  end
end
