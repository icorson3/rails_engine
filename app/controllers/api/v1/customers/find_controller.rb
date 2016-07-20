class Api::V1::Customers::FindController < ApplicationController
  def index
    customer = Customer.where(customer_params)
    render json: customer
  end

  def show
    customer = Customer.find_by(customer_params)
    render json: customer
  end

  private

  def customer_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end

end
