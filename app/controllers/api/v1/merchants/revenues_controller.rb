class Api::V1::Merchants::RevenuesController < ApplicationController

  def index
    top_earners = Merchant.most_revenue(params[:quantity])
    render json: top_earners, each_serializer: MostRevenueSerializer
  end

  def show
    merchant = Merchant.find(params[:merchant_id]) if params[:merchant_id]
    if params[:merchant_id] && params["date"]
      render json: merchant.revenue_by_date(params["date"]), serializer: RevenueSerializer
    elsif params["date"]
      render json: Invoice.total_revenue_on_date(params["date"]), serializer: TotalRevenueSerializer
    else
      render json: merchant.revenue, serializer: RevenueSerializer
    end
  end
end
