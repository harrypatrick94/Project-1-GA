Rails.application.routes.draw do

  get '/login' => 'session#new'

  post '/loging' => "session#create"

  delete '/login' => 'session#destroy'
  # Routes
  resources :users
  resources :genres
  resources :songs

end
