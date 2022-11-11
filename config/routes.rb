Rails.application.routes.draw do
  resources :pages
  devise_for :users
  root to: "questions#index"
  resources :questions
  
  resources :users, only: [:show, :edit, :update] do
    get :favorites, on: :collection
  end


  resources :questions, expect: [:index] do
    resource :favorites, only: [:create, :destroy]
  end


end
