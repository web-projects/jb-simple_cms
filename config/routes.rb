Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  # ROOT INDEX
  root 'demo#index'

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

end
