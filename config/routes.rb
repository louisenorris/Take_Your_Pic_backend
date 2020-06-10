Rails.application.routes.draw do
  resources :polaroids
  resources :users
  post '/login', to: 'auth#create' 
  get '/validate', to: 'auth#validate_token'
  get '/finduser/:id', to: 'users#find_user'
  get '/polaroids', to: 'polaroids#index'
  post '/polaroids', to: 'polaroids#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
