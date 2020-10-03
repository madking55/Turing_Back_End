Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :flights, only: :show
  resources :passengers, only: :show
  post '/passengers/:passenger_id/flights', to: 'passenger_flights#create'
end
