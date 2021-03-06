class Api::V1::Items::RevenueAnalyticsController < ApplicationController

  def index
    render json: Item.most_revenue(params[:quantity]), each_serializer: MostRevenueSerializer
  end
end
