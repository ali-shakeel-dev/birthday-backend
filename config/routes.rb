Rails.application.routes.draw do
  post '/signup', to: 'users#create'
  post '/login', to: 'auth#login'

  resources :wishes, only: [:index, :create, :update, :destroy]
end
