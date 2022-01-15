Rails.application.routes.draw do
  scope "(:locale)", locale: /en|es|ar/ do
    devise_for :users
    root to: 'pages#home'
    resources :resources, except: :show do
      collection do
        get 'top'
      end
      resources :favourites, only: [:create, :destroy]
    end
    resources :users, only: [:show] do
      resources :dashboard, only: [:index]
    end
  end
end
