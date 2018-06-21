Rails.application.routes.draw do
  get 'places/index'
   resources :places

  root 'places#index'
  root 'places#new'

 end
