class Api::V1::Transactions::FindController < ApplicationController

  def index
    if params["id"]
      transaction = Transaction.where(id: params[:id])
    elsif params["invoice_id"]
      transaction = Transaction.where(invoice_id: params[:invoice_id])
    elsif params["credit_card_number"]
      transaction = Transaction.where(credit_card_number: params[:credit_card_number])
    elsif params["result"]
      transaction = Transaction.where(result: params[:result])
    elsif params["created_at"]
      transaction = Transaction.where(created_at: params[:created_at])
    elsif params["updated_at"]
      transaction = Transaction.where(updated_at: params[:updated_at])
    end
    render json: transaction
  end

  def show
    if params["id"]
      transaction = Transaction.find(params[:id])
    elsif params["invoice_id"]
      transaction = Transaction.find_by(invoice_id: params[:invoice_id])
    elsif params["credit_card_number"]
      transaction = Transaction.find_by(credit_card_number: params[:credit_card_number])
    elsif params["result"]
      transaction = Transaction.find_by(result: params[:result])
    elsif params["created_at"]
      transaction = Transaction.find_by(created_at: params[:created_at])
    elsif params["updated_at"]
      transaction = Transaction.find_by(updated_at: params[:updated_at])
    end
    render json: transaction
  end

end
