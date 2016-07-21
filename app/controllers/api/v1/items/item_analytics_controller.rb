class Api::V1::Items::ItemAnalyticsController < ApplicationController

  def index
    render json: Item.most_items(params[:quantity]), each_serializer: MostRevenueSerializer
  end

  def show
    item = Item.find(params[:item_id])
    render json: item.best_day, serializer: BestDaySerializer
  end
end
