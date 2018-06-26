Rails.application.routes.draw do
  get 'places/index'
   resources :places do 
   	resources :comments
   	
   end

  root 'places#index'
  root 'places#new'

 end
