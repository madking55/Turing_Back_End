Rails.application.routes.draw do
  root 'welcome#index'

  namespace :admin do
    get '/dashboard', to: 'dashboard#index'
  end

  get '/users/new', to: 'users#new'
  post '/users', to: 'users#create'

  # resources :sessions, only: [:new, :create, :delete], path: "/login"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'

  get '/profile', to: 'users#show'

  resources :songs, only: [:show, :index]

  resources :artists do
    resources :songs, only: [:new, :create]
  end
    # get '/artists', to: 'artists#index'
    # get '/artists/new', to: 'artists#new'
    # post '/artists', to: 'artists#create'
    # delete '/artists/:id', to: 'artists#destroy'
    # get '/artists/:id/edit', to: 'artists#edit'
    # patch '/artists/:id', to: 'artists#update'
    # get '/artists/:artist_id/songs/new', to: 'songs#new'
    # post '/artists/:artist_id/songs', to: 'songs#create'

  get '/playlists', to: 'playlists#index'

  patch '/cart/:song_id', to: 'cart#update' 
end
 