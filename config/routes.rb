Rails.application.routes.draw do
  scope "(:locale)", locale: /en|ar|es/ do
    devise_for :users
    root to: 'pages#home'

    resources :resources do
      resources :dashboard, only: [:index, :create]
      resources :favourites, only: [:index, :create]

    end

    resources :favourites, only: [:destroy]

    resources :users, only: [:show] do
    end
  end
end
