class Api::V1::Customers::FindController < ApplicationController
  def index
    if params[:id]
      customer = Customer.where(id: params[:id])
    else
      customer = Customer.where(customer_params)
    end
    render json: customer
  end

  def show
    if params[:id]
      customer = Customer.find(params[:id])
    else
      customer = Customer.find_by(customer_params)
    end
    render json: customer
  end


  private

  def customer_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end

end
