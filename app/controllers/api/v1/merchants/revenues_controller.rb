class Api::V1::Merchants::RevenuesController < ApplicationController

  def index
    top_revenue_earners = Merchant.most_revenue(params[:quantity])
    render json: top_revenue_earners
  end


  def show
    merchant = Merchant.find(params[:merchant_id])
    if params["date"]
      revenue = merchant.revenue_by_date(params["date"])
      render json: revenue
    else
      revenue = merchant.revenue
      render json: revenue
    end
  end

end
