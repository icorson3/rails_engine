class ApplicationController < ActionController::API

  def query_price_to_cents(query_price)
    float_price = query_price.to_f*100
    float_price.to_s
  end


end
