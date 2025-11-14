Rails.application.routes.draw do
  root 'topics#index'
  get "topics/top", to: "topics#top"
  devise_for :users
  resources :likes, only: [:create, :destroy]
  resources :topics do
    resources :likes, only: [:create, :destroy]
    resources :comments do
      resources :likes, only: [:create, :destroy], module: :comments
    end
  resources :comments, only: [:new, :create, :destroy, :show]
  end
  
  resources :idols
end