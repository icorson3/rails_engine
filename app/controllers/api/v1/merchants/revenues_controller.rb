class Api::V1::Merchants::RevenuesController < ApplicationController

  def index
    top_revenue_earners = Merchant.most_revenue(params[:quantity])
    render json: top_revenue_earners, each_serializer: MostRevenueSerializer
  end

  def show
    merchant = Merchant.find(params[:merchant_id]) if params[:merchant_id]
    if params[:merchant_id] && params["date"]
      revenue = merchant.revenue_by_date(params["date"])
      render json: revenue, serializer: RevenueSerializer
    elsif params["date"]
      revenue = Invoice.total_revenue_on_date(params["date"])
      render json: revenue
    else
      revenue = merchant.revenue
      render json: revenue, serializer: RevenueSerializer
    end

  end

end
