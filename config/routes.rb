Rails.application.routes.draw do
  scope "(:locale)", locale: /en|ar|es/ do
    devise_for :users
    root to: 'pages#home'
    get '/dashboard', to: 'pages#dashboard', as: :dashboard
    patch 'resources/:id/approve', to: 'resources#approve', as: 'resource_approve'

    resources :resources do
      resources :favourites, only: [:index, :create]
    end
    # resources :dashboard, only: [:index, :confirmed]
    resources :resources, only: [:approve]
    resources :favourites, only: [:destroy]
    resources :users, only: [:show] do
    end

  end
end
