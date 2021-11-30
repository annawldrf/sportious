Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :courts, :reviews, only: [:new, :create, :show, :index] do
    resources :check_ins, :reviews, only: [:create]
  end
  
  get '/dashboard', to: 'dashboards#show'
  get "/favorite", to: "courts#favorites"
  
  resources :lessons, only: [:new, :create, :show, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
