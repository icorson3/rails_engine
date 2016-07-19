Rails.application.routes.draw do
  get 'api/v1/merchants/find' => 'api/v1/merchants/find#show'
  get 'api/v1/merchants/find_all' => 'api/v1/merchants/find#index'
  get 'api/v1/merchants/random' => 'api/v1/merchants/random#show'
  get 'api/v1/transactions/find' => 'api/v1/transactions/find#show'
  get 'api/v1/transactions/find_all' => 'api/v1/transactions/find#index'
  get 'api/v1/transactions/random' => 'api/v1/transactions/random#show'

  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index, :show], defaults: { format: :json }
      resources :transactions, only: [:index, :show], defaults: { format: :json }
    end
  end


end
