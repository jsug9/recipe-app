Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "recipes#all"

  get '/public_recipes', to: "recipes#all", as: :home
  get '/foods', to: "foods#index"
  resources :recipes, only: [:index, :show]

end
