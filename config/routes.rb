Betastore::Application.routes.draw do
  resources :products, only: [:index, :show]
  resources :subscriptions, only: [:new, :create, :show]
  resources :orders do
    resource :refund
  end
  root :to => 'subscriptions#new'
end
