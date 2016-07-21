class Api::V1::Customers::MerchantAnalyticsController < ApplicationController

  def show
    customer = Customer.find(params[:customer_id])
    favorite_merchant = customer.favorite_merchant
    render json: favorite_merchant, each_serializer: FavoriteMerchantSerializer
  end
end
