Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :courts, only: [:new, :create, :show, :index] do
    resources :check_ins, only: [:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
