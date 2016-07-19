class Api::V1::Transactions::RandomController < ApplicationController

  def show
    offset = rand(Transaction.count)
    random_record = Transaction.offset(offset).first
    render json: random_record
  end
end
