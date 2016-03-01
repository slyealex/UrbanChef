Rails.application.routes.draw do


  root 'home#index'

  resources :clients

  resources :chefs do
    resources :products
  end

  resources :orders
  resources :line_items

end
