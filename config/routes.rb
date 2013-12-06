Betastore::Application.routes.draw do
  namespace :admin do
    resources :products
    resources :orders
    root :to => 'dashboard#index'
  end

  get '/categories/:category_id/products' => 'products#index', as: 'category_products'

  resources :products, only: [:index, :show]

  resources :subscriptions, only: [:new, :create, :show]

  get '/checkout' => 'orders#new', as: 'checkout'
  post '/checkout' => 'orders#create'

  get '/cart' => 'cart_items#index', as: 'cart_items'
  post '/products/:product_id/cart_items' => 'cart_items#create', as: 'add_to_cart'

   get '/forgot_password' => 'password_resets#new', as: 'forgot_password'
  post '/forgot_password' => 'password_resets#create'

   get '/reset_password/:id/:token' => 'password_resets#edit', as: 'reset_password'
  post '/reset_password/:id/:token' => 'password_resets#update'

   get '/sign_up' => 'customers#new', as: 'sign_up'
  post '/sign_up' => 'customers#create'

   get '/log_in'  => 'log_ins#new', as: 'log_in'
  post '/log_in'  => 'log_ins#create'
  post '/log_out' => 'log_ins#destroy', as: 'log_out'

  get '/:action', :controller => 'pages'

  root :to => 'products#index'
end
