Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
    resources :resources, except: :show do
      # collection do
      # get 'top'
      # resources :favourites, only: [:index]
      end

resources :resources do
  put :favourite, on: :member
end


  resources :users, only: [:show] do
    resources :dashboard, only: [:index]
end

end
