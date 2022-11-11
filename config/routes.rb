Rails.application.routes.draw do
  resources :pages
  devise_for :users
  root to: "questions#index"
  resources :questions
  
end
