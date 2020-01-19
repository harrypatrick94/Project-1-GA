Rails.application.routes.draw do


  root to: 'session#new'

  get 'concerts/map' => 'concerts#map'

  get "artists/:artist_id/map" => "artists#map"

  get '/login' => 'session#new'

  post '/login' => "session#create"

  delete '/login' => 'session#destroy'
# new song
  get '/genres/:genre_id/songs/new' => 'songs#new', as: :new_song_in_genre
# show song
  get 'users/:user_id/genres/:genre_id/songs/:id' => 'songs#show', as: :song_in_genre
# edit song
  get '/genres/:genre_id/songs/:id/edit' => 'songs#edit', as: :edit_song_in_genre
# new genre
  get 'users/:user_id/genres/new' => 'genres#edit', as: :new_genre_in_user
# show genres
  get 'users/:user_id/genres/:genre_id' => 'genre#show', as: :genre_in_user
# edit genres
  get 'user/:user_id/genres/:genre_id/edit' => 'genre#show', as: :edit_genre_in_user
  # Routes
  resources :users
  resources :genres
  resources :songs
  resources :concerts
  resources :artists

end
