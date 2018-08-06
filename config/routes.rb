Rails.application.routes.draw do

  # ROOT INDEX
  root :to => 'public#index'

  get 'show/:permalink', :to => 'public#show', :as => 'public_show'

  get 'admin', :to => 'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  # RESOURCEFUL routes for ADMIN - show route does not exist (so exclude it!)
  resources :admin_users, :except => [:show] do
    member do
      get :delete
    end
  end

  # Manual Configuration for DELETE
  resources :subjects do
    member do
      get :delete
    end
  end

  # RESOURCEFUL routes for PAGES
  resources :pages do
    member do
      get :delete
    end
  end

  # RESOURCEFUL routes for SUBJECTS
  resources :sections do
    member do
      get :delete
    end
  end

  # DEMO ONLY
  get 'demo/index'
  get 'demo/hello'
  get 'demo/escape_output'

end
