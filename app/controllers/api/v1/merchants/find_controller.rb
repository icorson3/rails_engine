class Api::V1::Merchants::FindController < ApplicationController
  def index
    if params[:id]
      merchant = Merchant.where(id: params[:id])
    else
      merchant = Merchant.where(merchant_params)
    end
    render json: merchant
  end

  def show
    if params[:id]
      merchant = Merchant.find(params[:id])
    else
      merchant = Merchant.find_by(merchant_params)
    end
    render json: merchant
  end


  private

  def merchant_params
    params.permit(:id, :name, :created_at, :updated_at)
  end

end
