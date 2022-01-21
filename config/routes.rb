Rails.application.routes.draw do
  scope "(:locale)", locale: /en|ar|es/ do
    devise_for :users
    root to: 'pages#home'

    resources :resources do
      resources :favourites, only: %i[create]
    end

    resources :favourites, only: [:destroy]

    resources :resources, only: [:show]

    resources :users, only: [:show] do
      resources :dashboard, only: [:index]
    end
  end
end
