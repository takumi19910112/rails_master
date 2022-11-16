Rails.application.routes.draw do
  resources :pages 
  devise_for :users
  root to: "questions#index"
  resources :users, only: [:show] do 
    get :bookmarks, on: :collection 
  end

  resources :questions do
    resources :favorites, only: [:create ,:destroy]
     resources :comments
      resources :bookmarks
       collection do
          get "search"
       end 
     end
   

  
end
