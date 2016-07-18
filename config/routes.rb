Rails.application.routes.draw do
  get 'api/v1/merchants/find' => 'api/v1/merchants/find#show'
  get 'api/v1/merchants/find_all' => 'api/v1/merchants/find#index'
  get 'api/v1/merchants/random' => 'api/v1/merchants/random#show'

  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index, :show], defaults: { format: :json }
    end
  end


end
