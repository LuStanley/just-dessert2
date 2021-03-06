Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }



  resources :desserts do
    resources :orders
    resources :comments, only: [:create, :destroy] do
      resources :replies, only: [:create, :destroy]
    end
  end
  
  resources :categories, only: :show
  resources :users, only: [:show, :edit, :update]
  resources :orders
  root "desserts#index"

  namespace :admin do
    resources :users
    root "users#index"
  end

end
