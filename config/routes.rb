Rails.application.routes.draw do
  root 'products#index'

  resources :subcategories do

  end

  resources :categories

  resources :products, only: [:show, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
