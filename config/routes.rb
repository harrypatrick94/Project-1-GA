Rails.application.routes.draw do

  get '/login' => 'session#new'

  post '/login' => "session#create"

  delete '/login' => 'session#destroy'

  get '/genres/:id/songs/new' => 'songs#new', as: :add_song

  # Routes
  resources :users
  resources :genres
  resources :songs


end
