Rails.application.routes.draw do


  devise_for :chefs
  devise_for :clients
  root 'home#index'

  resources :clients do
    resources :orders
  end

  resources :chefs do
    resources :products
    resources :orders
  end

  resources :line_items

end
