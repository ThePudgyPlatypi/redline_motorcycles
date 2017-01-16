Rails.application.routes.draw do
  # root
  root 'products#index'

  # All the user authentication routes
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'log_out', sign_up: 'register' }

  # routes for my main categories
  resources :categories
  # routes for my subcategories
  resources :subcategories
  # routes for my products
  resources :products, only: [:show, :index]
  # Routes for the cart controller
  # The only - show just makes a route for only show
  # The best way I can understand this is that its assigning a non-REST-ful routes
  # that still has the helper URLS
  # This is routed only thru the show view
  resource :cart, only: [:show] do
    put 'add/:product_id', to: 'carts#add', as: :add_to
    put 'remove/:product_id', to: 'carts#remove', as: :remove_from
  end

  # routes for all transactions
  resource :transactions, only: [:new, :create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
