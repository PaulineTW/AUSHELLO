Rails.application.routes.draw do
  scope "(:locale)", locale: /en|ar|es/ do
    devise_for :users
    root to: 'pages#home'

    resources :resources do
      resources :favourites, only: [:index, :create]
    end
    resources :dashboard, only: [:index, :confirmed]
    resources :resources, only: [:confirmed]

    patch "resources/:id/confirmed", to: "dashboard#confirmed", as: 'dashboard_confirmed'
    resources :favourites, only: [:destroy]
    resources :users, only: [:show] do
    end
    # get '/en/dashboard', to: 'pages#dashboard', as: :dashboard
  end
end
