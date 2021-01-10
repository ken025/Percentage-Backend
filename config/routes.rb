Rails.application.routes.draw do
  resources :resources
  resources :accounts do 
    resources :expenses 
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :update]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      post '/autologin', to: 'auth#autologin'
    end
  end
end
