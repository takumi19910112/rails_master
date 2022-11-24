Rails.application.routes.draw do
  resources :pages 
    devise_for :users, controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks',
      registrations: 'users/registrations'
    }
  root to: "questions#index"
  resources :users, only: [:show,:index,:edit,:update] do 
    member do
      get :bookmarks
    end 
  end

  resources :questions do
    resources :favorites
     resources :comments
      resources :bookmarks
       collection do
          get "search"
       end 
     end
   
     resources :users, only: [:show,:index,:edit,:update,:new] do
      member do
        get :favorites
      end
    end

    namespace :api, format: :json do
      namespace :v1 do
        post '/questions/preview', to: 'questions#preview'
        post '/questions/upload', to: 'questions#upload' # 追加
      end
    end



end
