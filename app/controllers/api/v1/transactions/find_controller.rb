class Api::V1::Transactions::FindController < ApplicationController
  def index
    if params[:id]
      transaction = Transaction.where(id: params[:id])
    else
      transaction = Transaction.where(transaction_params)
    end
    render json: transaction
  end

  def show
    if params[:id]
      transaction = Transaction.find(params[:id])
    else
      transaction = Transaction.find_by(transaction_params)
    end
    render json: transaction
  end


  private

  def transaction_params
    params.permit(:id, :credit_card_number, :result, :invoice_id, :created_at, :updated_at)
  end

end
