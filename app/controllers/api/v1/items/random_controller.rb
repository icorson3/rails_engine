class Api::V1::Items::RandomController < ApplicationController

  def show
    offset = rand(Item.count)
    random_record = Item.offset(offset).first
    render json: random_record
  end
end
