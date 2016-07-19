class Api::V1::Customers::FindController < ApplicationController

  def index
    if params["id"]
      customer = Customer.where(id: params[:id])
    elsif params["first_name"]
      table = Customer.arel_table
      customer = Customer.where(table[:first_name].matches("#{params["first_name"]}"))
    elsif params["last_name"]
      table = Customer.arel_table
      customer = Customer.where(table[:last_name].matches("#{params["last_name"]}"))
    elsif params["created_at"]
      customer = Customer.where(created_at: params[:created_at])
    elsif params["updated_at"]
      customer = Customer.where(updated_at: params[:updated_at])
    end
    render json: customer
  end

  def show
    if params["id"]
      customer = Customer.find(params[:id])
    elsif params["first_name"]
      table = Customer.arel_table
      customer = Customer.find_by(table[:first_name].matches("#{params["first_name"]}"))
    elsif params["last_name"]
      table = Customer.arel_table
      customer = Customer.find_by(table[:last_name].matches("#{params["last_name"]}"))
    elsif params["created_at"]
      customer = Customer.find_by(created_at: params[:created_at])
    elsif params["updated_at"]
      customer = Customer.find_by(updated_at: params[:updated_at])
    end
    render json: customer
  end

end
