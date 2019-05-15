Rails.application.routes.draw do
  get "movies/index"
  get "movies/show"
  get "movies/create"
  get "customers/index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :movies, only: [:index, :show, :create]
  resources :customers, only: [:index]

  post "rentals/check-out", to: "rentals#create", as: "check-out"

  post "rentals/check-in", to: "rentals#update", as: "check-in"

  get "/zomg", to: "application#test", as: "test"
end
