Rails.application.routes.draw do
  scope "(:locale)", locale: /en|ar|es/ do
    devise_for :users
    root to: 'pages#home'
    get '/dashboard', to: 'pages#dashboard', as: :dashboard

    resources :resources do
      resources :favourites, only: [:index, :create]
    end
    # resources :dashboard, only: [:index, :confirmed]
    resources :resources, only: [:confirmed]

    patch "resources/:id/confirmed", to: "dashboard#confirmed", as: 'dashboard_confirmed'
    resources :favourites, only: [:destroy]
    resources :users, only: [:show] do
    end

  end
end
