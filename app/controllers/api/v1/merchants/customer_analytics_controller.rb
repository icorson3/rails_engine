class Api::V1::Merchants::CustomerAnalyticsController < ApplicationController

  def index
    render json: Merchant.find(params[:merchant_id]).customers_with_pending_invoices
  end

  def show
    render json: Merchant.find(params[:merchant_id]).favorite_customer
  end
end
