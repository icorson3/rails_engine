class Api::V1::Customers::MerchantAnalyticsController < ApplicationController

  def show
    customer = Merchant.favorite_of_customer(params[:customer_id])
    render json: customer, each_serializer: FavoriteMerchantSerializer
  end
end
