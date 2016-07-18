class Api::V1::Merchants::RandomController < ApplicationController

  def show
    offset = rand(Merchant.count)
    random_record = Merchant.offset(offset).first
    render json: random_record
  end
end
