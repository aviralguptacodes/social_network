Rails.application.routes.draw do
  devise_for :users
  resources :groups do
    resources :posts, only: [:create, :index]
  end
  resources :posts, only: [:show] do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :index]
  end
  root 'groups#index'
end