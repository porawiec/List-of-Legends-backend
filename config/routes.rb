Rails.application.routes.draw do
  resources :friendships
  resources :wishes
  resources :user_champs
  resources :skins
  resources :champs

  resources :users, only: [:create, :index]
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  delete '/destroyWithIds', to: 'wishes#destroyWithIds'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
