Rails.application.routes.draw do

  get '/login' => 'session#new'

  post '/login' => "session#create"

  delete '/login' => 'session#destroy'
  # Routes
  resources :users
  resources :genres
  resources :songs

end
