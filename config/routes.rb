# frozen_string_literal: true

Rails.application.routes.draw do
  resources :students
  resources :libraries
  resources :books
  get '/checkout', to: 'books#checkout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
