class Api::V1::InvoicesController < ApplicationController

  before_action :load_merchant, only: [:index]

  def load_merchant
    @merchant = Merchant.find(params[:merchant_id]) if params[:merchant_id]
    @invoices = @merchant ? @merchant.invoices : Invoice.all
  end

  def index
    render json: @invoices
  end

  def show
    render json: Invoice.find(params[:id])
  end
end
