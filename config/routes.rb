Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :resources do
    resources :favourites, only: %i[create]
  end

  resources :favourites, only: [:destroy]

    resources :users, only: [:show] do
      resources :dashboard, only: [:index]
  end
end
