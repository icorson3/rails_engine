class Api::V1::Invoices::TransactionsController < ApplicationController

  def index
    invoice = Invoice.find(params[:invoice_id])
    transactions = invoice.transactions
    render json: transactions
  end
end
