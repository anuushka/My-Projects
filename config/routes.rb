Rails.application.routes.draw do

  root to: 'session#index'
  
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

resources :login do
    collection do
      get 'signup', to: "login#new"
      get 'login', to: "login#index"
      post 'login', to: "login#login"
      get 'dashboard', to: "login#dashboard"
      get 'approve',to: "login#approve"
      get 'decline',to: "login#decline"
      get 'deniedboard',to: "login#denied"
      get 'acceptboard',to: "login#accept"


    end
  end

  resources :session do
    collection do
      #get 'edit/:user_id', to: "session#edit"
      get 'signup', to: "session#new"
      get 'login', to: "session#index"
      post 'login', to: "session#login"
      get 'dashboard', to: "session#dashboard"
      get 'logout', to: "session#logout"
      post 'social/login', to: "session#social_login"

      
    end
  end

 end


