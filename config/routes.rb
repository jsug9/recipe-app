Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "recipes#all"

  get '/public_recipes', to: "recipes#all", as: :home
  resources :foods
  resources :recipes, only: [:index, :show, :create, :destroy]

end
