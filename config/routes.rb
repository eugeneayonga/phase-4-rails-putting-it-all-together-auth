Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/me", to: "users#show"

  get "/recipes", to: "recipes#index"

  post "/signup", to: "users#create"

  post "/recipes", to: "recipes#create"

  post "/login", to: "sessions#create"

  delete "/logout", to: "sessions#destroy"
end
