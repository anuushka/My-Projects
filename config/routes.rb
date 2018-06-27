Rails.application.routes.draw do
  get 'places/index'
   resources :places do 
   	resources :comments
   	resources :categories
   end

  root 'places#index'
  root 'places#new'

 end
