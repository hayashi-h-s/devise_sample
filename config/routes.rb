Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    # :sessions => 'users/sessions'
  } 
  

  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :show, :create] do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  #/posts/likes/create or /posts/likes/destroy を設定している

  root 'posts#index'
end