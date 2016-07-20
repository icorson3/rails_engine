class Api::V1::Merchants::RevenuesController < ApplicationController

  def index
    top_revenue_earners = Merchant.most_revenue(params[:quantity])
    render json: top_revenue_earners
  end


  def show
    merchant = Merchant.find(params[:merchant_id])
    revenue = merchant.revenue
    render json: revenue

  end

end
