Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home';
  get "my_recipes", to: 'recipes#my_recipes'
  get "profile", to: 'pages#profile'
  patch "profile", to: "pages#profile_update"
  resources :recipes do
    resources :doses, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end
  resources :doses, only: [:edit, :update, :destroy]
end
