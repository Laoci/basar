Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get "shops" show all
  get "results", to: "shops#index"

  # cart routes
  get "cart", to: "shops#new"
  post "cart", to: "shops#create"
  get 'my_cart', to: "carts#show"
  # delete "cart", to: "shops#destroy"
end
