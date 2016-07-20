class Api::V1::Transactions::FindController < ApplicationController
  def index
    transaction = Transaction.where(transaction_params)
    render json: transaction
  end

  def show
    transaction = Transaction.find_by(transaction_params)
    render json: transaction
  end

  private

  def transaction_params
    params.permit(:id, :credit_card_number, :result, :invoice_id, :created_at, :updated_at)
  end

end
