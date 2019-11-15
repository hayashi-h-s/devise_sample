Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :show, :create] do
    resources :likes, only: [:create, :destroy]
  end
  #/posts/likes/create or /posts/likes/destroy を設定している

  root 'posts#index'
end
