class Api::V1::Transactions::InvoicesController < ApplicationController

  def show
    transaction = Transaction.find(params[:transaction_id])
    invoice = transaction.invoice
    render json: invoice
  end
end
