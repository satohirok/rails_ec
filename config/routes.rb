# frozen_string_literal: true

Rails.application.routes.draw do
  post '/add_item', to: 'carts#add_item', as: 'add_item'

  namespace :admin do
    resources :products
  end
  root to: 'items#index'
  resources :items
  resources :carts
  resources :item_carts

  resources :tasks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
