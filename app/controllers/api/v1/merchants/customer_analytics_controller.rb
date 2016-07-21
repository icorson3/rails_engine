class Api::V1::Merchants::CustomerAnalyticsController < ApplicationController

  def index
    merchant = Merchant.find(params[:merchant_id])
    customers_with_pending_invoices = merchant.customers_with_pending_invoices
    render json: customers_with_pending_invoices
  end

  def show
    merchant = Merchant.find(params[:merchant_id])
    favorite_customer = merchant.favorite_customer
    render json: favorite_customer
  end
end
