Rails.application.routes.draw do
  resources :pages
  devise_for :users
  root to: "questions#index"
  resources :users
  resources :questions do
    resources :favorites, only: [:create ,:destroy]
     resources :comments
      resources :bookmarks
end

  
end
