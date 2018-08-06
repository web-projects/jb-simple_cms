Rails.application.routes.draw do

  # ROOT INDEX
  root 'demo#index'

  get 'admin', :to => 'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get  'access/logout'

  # Manual Configuration for DELETE
  resources :subjects do
    member do
      get :delete
    end
  end

  # Manual Configuration for PAGES
  resources :pages do
    member do
      get :delete
    end
  end

  # Manual Configuration for SUBJECTS
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
