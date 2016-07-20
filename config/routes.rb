Rails.application.routes.draw do
  get 'api/v1/merchants/find' => 'api/v1/merchants/find#show'
  get 'api/v1/merchants/find_all' => 'api/v1/merchants/find#index'
  get 'api/v1/merchants/random' => 'api/v1/merchants/random#show'

  get 'api/v1/transactions/find' => 'api/v1/transactions/find#show'
  get 'api/v1/transactions/find_all' => 'api/v1/transactions/find#index'
  get 'api/v1/transactions/random' => 'api/v1/transactions/random#show'

  get 'api/v1/transactions/:transaction_id/invoice' => 'api/v1/transactions/invoices#show'

  get 'api/v1/customers/find' => 'api/v1/customers/find#show'
  get 'api/v1/customers/find_all' => 'api/v1/customers/find#index'
  get 'api/v1/customers/random' => 'api/v1/customers/random#show'


  get 'api/v1/invoices/find' => 'api/v1/invoices/find#show'
  get 'api/v1/invoices/find_all' => 'api/v1/invoices/find#index'
  get 'api/v1/invoices/random' => 'api/v1/invoices/random#show'


  get 'api/v1/items/find' => 'api/v1/items/find#show'
  get 'api/v1/items/find_all' => 'api/v1/items/find#index'
  get 'api/v1/items/random' => 'api/v1/items/random#show'

  get 'api/v1/invoice_items/:invoice_item_id/item' => 'api/v1/invoice_items/items#show'
  get 'api/v1/invoice_items/:invoice_item_id/invoice' => 'api/v1/invoice_items/invoices#show'

  get 'api/v1/customers/:customer_id/invoices' => 'api/v1/customers/invoices#index'
  get 'api/v1/customers/:customer_id/transactions' => 'api/v1/customers/transactions#index'

  get 'api/v1/invoice_items/find' => 'api/v1/invoice_items/find#show'
  get 'api/v1/invoice_items/find_all' => 'api/v1/invoice_items/find#index'
  get 'api/v1/invoice_items/random' => 'api/v1/invoice_items/random#show'

  get 'api/v1/merchants/:merchant_id/items' => 'api/v1/merchants/items#index'
  get 'api/v1/merchants/:merchant_id/invoices' => 'api/v1/merchants/invoices#index'

  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index, :show], defaults: { format: :json }
      resources :invoices, only: [:index, :show], defaults: { format: :json }
      resources :transactions, only: [:index, :show], defaults: { format: :json }
      resources :items, only: [:index, :show], defaults: { format: :json }
      resources :customers, only: [:index, :show], defaults: { format: :json }
      resources :invoice_items, only: [:index, :show], defaults: { format: :json }
    end
  end
end
