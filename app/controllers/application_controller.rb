class ApplicationController < ActionController::API

  def query_price_to_cents(query_price)
    (query_price.to_f*100).round
    #could just strip decimal point
  end


end
