Rails.application.routes.draw do
  
  get 'places/index'
   resources :places do 
   	resources :comments
   	resources :categories
   end

  root 'places#index'
  root 'places#new'
  root to: 'session#index'

  resources :session do
    collection do
      get 'edit/:user_id', to: "session#edit"
      get 'signup', to: "session#new"
      get 'login', to: "session#index"
      post 'login', to: "session#login"
      get 'dashboard', to: "session#dashboard"
    end
  end

 end


