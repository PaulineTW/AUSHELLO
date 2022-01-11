Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
    resources :resources, except: :show do
      collection do
      get 'top'
    end
    resources :favourites, only: [:create, :destroy]
  end
  resources :users, only: [:show]
  get '/tagged', to: "resources#tagged", as: :tagged
end
