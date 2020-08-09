Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :dishes, only: :show
  get '/chefs/:id', to: 'chefs#show'
  get '/chefs/:id/ingredients', to: 'chefs#ingredients'
  
end
 