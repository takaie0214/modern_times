Rails.application.routes.draw do
  get 'home/index'
  root to: 'home#index'  

  get 'auth/:provider/callback', to: 'google#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'google#destroy', as: 'signout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :google, only: %i(new create destroy)
  resources :home, only: %i(index)
end
