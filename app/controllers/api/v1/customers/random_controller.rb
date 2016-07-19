class Api::V1::Customers::RandomController < ApplicationController

  def show
    offset = rand(Customer.count)
    random_record = Customer.offset(offset).first
    render json: random_record
  end
end
