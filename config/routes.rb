Rails.application.routes.draw do


  devise_for :chefs, :controllers => { registrations: 'chefs' }
  devise_for :clients, :controllers => { registrations: 'clients' }
  root 'home#index'


  resources :clients do
    resources :orders
  end

  resources :chefs do
    resources :products
    resources :orders
  end

  resources :line_items
  resources :orders

end
