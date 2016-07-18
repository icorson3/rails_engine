Rails.application.routes.draw do
  root 'api/v1/merchants#index'

  get 'api/v1/merchants/find' => 'api/v1/merchants/find#show'

  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index, :show], defaults: { format: :json }

    end
  end


end
