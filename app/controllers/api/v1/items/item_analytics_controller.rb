class Api::V1::Items::ItemAnalyticsController < ApplicationController

  def index
    render json: Item.most_items(params[:quantity]), each_serializer: MostRevenueSerializer
  end

  def show
    render json: Item.find(params[:item_id]).best_day, serializer: BestDaySerializer
  end
end
