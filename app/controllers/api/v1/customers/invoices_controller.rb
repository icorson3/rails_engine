class Api::V1::Customers::InvoicesController < ApplicationController

  def index
    customer = Customer.find(params[:customer_id])
    invoices = customer.invoices
    render json: invoices
  end
end
