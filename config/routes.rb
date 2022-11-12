Rails.application.routes.draw do
  resources :pages
  devise_for :users
  root to: "questions#index"
  resources :questions
  resources :users
  post 'favorite/:id' => 'favorites#create', as: 'create_favorite'
  delete 'favorite/:id' => 'favorites#destroy', as: 'destroy_favorite'


end
