class Api::V1::Merchants::RevenuesController < ApplicationController

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
