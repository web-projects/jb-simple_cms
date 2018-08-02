Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'demo#index'

  get 'demo/index'
  get 'demo/hello'
  get 'demo/redirect_to_hello'

end
