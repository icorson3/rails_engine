class Api::V1::Merchants::RevenuesController < ApplicationController

  def show
    merchant = Merchant.find(params[:merchant_id])
    revenue = merchant.revenue
    render json: revenue

  end

end
