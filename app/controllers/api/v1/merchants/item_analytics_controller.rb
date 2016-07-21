class Api::V1::Merchants::ItemAnalyticsController < ApplicationController

  def index
    render json: Merchant.most_items(params[:quantity]), each_serializer: MostRevenueSerializer
  end
end
