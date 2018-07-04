Rails.application.routes.draw do
  
  get 'places/check'
   resources :places do 
   	resources :comments
   	resources :categories
   end

  root 'places#index'
  root 'places#new'
  root 'places#check'
  root 'places#submit'
  root to: 'session#index'
  root to: 'login#index'

resources :login do
    collection do
      get 'signup', to: "login#new"
      get 'login', to: "login#index"
      post 'login', to: "login#login"
      get 'dashboard', to: "login#dashboard"
    end
  end

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


